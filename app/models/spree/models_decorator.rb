module Spree::ModelsDecorator
  SolidusMultiVendor.vendorized_models.each do |model|
    model.include Spree::VendorConcern
  end
end
