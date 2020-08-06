module Spree::Stock::PackageDecorator
    Spree::Stock::Package.include SolidusMultiVendor::Stock::PackageConcern
end