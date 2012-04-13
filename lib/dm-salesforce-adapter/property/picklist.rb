module SalesforceAdapter::Property
  class Picklist < ::DataMapper::Property::String
    def values_for_picklist
      @metadata ||= adapter.metadata(model)
      @values ||= @metadata.fields.select { |f| f.type =~ /picklist$/ && (f.name =~ /#{self.field}/i || f.name =~ /#{self.name.to_s}/i)}.first.picklistValues rescue []
      @values.map {|value| {:value => value.value, :label => value.label}}
    end

    def custom?
      true
    end

    private
    def adapter
      model.repository.adapter
    end
  end
end
