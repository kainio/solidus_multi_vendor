module Spree::ProductDecorator
  def self.prepended(base)
    base.after_destroy :touch_vendor
    base.after_update :assign_vendor_id
  end

  Spree::Product.whitelisted_ransackable_associations += %w[vendor]

  private

  def touch_vendor
    vendor&.touch
  end

  def assign_vendor_id
    return unless self.class.method_defined?(:vendor)

    variants.update_all(vendor_id: self.vendor_id)
  end
end

Spree::Product.prepend Spree::ProductDecorator
