module DataMapper
  module Adapters
    class SalesforceAdapter < DataObjectsAdapter
      module Resource
        def self.included(model)
          model.send :include, DataMapper::Resource
          model.send :include, DataMapper::Adapters::SalesforceAdapter::Property
        end
      end
    end
  end
end
