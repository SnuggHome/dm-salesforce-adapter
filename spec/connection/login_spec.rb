require 'spec_helper'

describe DataMapper::Adapters::SalesforceAdapter::Connection do
  describe "when authenticating without an organization id" do
    describe "with the correct credentials" do
      it "succeeds" do
        db = ::DataMapper.repository(:salesforce).adapter.connection
        described_class.new(SALESFORCE_CONFIG['username'], SALESFORCE_CONFIG['password'], db.wsdl_path, db.api_dir)
      end
    end

    describe "with an invalid password" do
      it "fails to login" do
        db = ::DataMapper.repository(:salesforce).adapter.connection
        lambda { described_class.new(SALESFORCE_CONFIG['username'], 'bad-password', db.wsdl_path, db.api_dir) }.
          should raise_error(described_class::LoginFailed)
      end
    end
  end
end
