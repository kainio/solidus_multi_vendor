class AddVendorIdToSpreeModels < SolidusSupport::Migration[4.2]
  def change
    table_names = %w[
      products
      stock_locations
      shipping_methods
      stores
    ]

    table_names.each do |table_name|
      add_reference "spree_#{table_name}", :vendor, index: true
    end
  end
end
