module SalesforceAdapter::Property
  class Serial < ::DataMapper::Property::String
    accept_options :serial
    serial true

    length 18

    def load(value)
      super value[0..14] unless value.blank?
    end

    def dump(value)
      value[0..17] unless value.blank?
    end
  end
end
