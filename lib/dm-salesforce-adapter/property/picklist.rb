module SalesforceAdapter::Property
  class Picklist < ::DataMapper::Property::String
    def values_for_picklist
      @metadata ||= connection.metadata(model.salesforce_class)
      @values ||= @metadata.fields.select { |f| f.name =~ /#{self.field}/i || f.name =~ /#{self.name.to_s}/i}.first.picklistValues rescue []
      @values.map {|value| {:value => value.value, :label => value.label}}
    end

    private
    def connection
      model.repository.adapter.connection
    end
  end
end
