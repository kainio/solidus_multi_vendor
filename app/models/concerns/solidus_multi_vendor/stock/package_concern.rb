module SolidusMultiVendor
  module Stock
    module PackageConcern
      extend ActiveSupport::Concern
      included do
        prepend(InstanceMethods)
      end

      module InstanceMethods
        def shipping_methods
          (vendor = stock_location.vendor) ? vendor.shipping_methods : super
        end
      end
    end
  end
end