Spree::Admin::StockLocationsController.class_eval do
  before_action :set_vendor_id, only: [:create, :update]
  before_action :vendor_only, only: [:index]

  private

  def vendor_only
    @stock_locations = @stock_locations.with_vendor(current_spree_vendor.id) if current_spree_vendor
  end
end
