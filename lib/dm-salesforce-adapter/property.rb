module DataMapper
  module Adapters
    class SalesforceAdapter < DataObjectsAdapter
      module Property
      end
    end
  end
end

require 'dm-salesforce-adapter/property/serial'
require 'dm-salesforce-adapter/property/boolean'
