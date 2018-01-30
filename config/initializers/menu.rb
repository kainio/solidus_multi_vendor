Spree::Backend::Config.configure do |config|
  config.menu_items << config.class::MenuItem.new(
      [:vendors],
      'handshake-o',
      condition: -> { Spree.user_class && can?(:admin, current_store)} # || current_spree_user.vendors.any?}
  )
end