module Spree
  class Vendor < Spree::Base
    acts_as_paranoid

    validates :name, presence: true, uniqueness: { case_sensitive: false }

    with_options dependent: :destroy do
      has_many :products
      has_many :shipping_methods
      has_many :stock_locations
      has_many :vendor_users
      has_many :stores
    end

    has_many :users, through: :vendor_users

    state_machine :state, initial: :pending do
      event :activate do
        transition to: :active
      end

      event :block do
        transition to: :blocked
      end
    end

    self.whitelisted_ransackable_attributes = %w[name state]

    before_save :populate_state

    def populate_state
      state ||= :pending
    end

  end
end
