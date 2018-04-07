Spree::Variant.class_eval do

  delegate :vendor_id, to: :product

  def create_stock_items
    Spree::StockLocation.where(propagate_all_variants: true, vendor_id: vendor_id).each do |stock_location|
      stock_location.propagate_variant(self)
    end
  end
end
