require 'spec_helper'

describe Spree::Vendor do
  describe 'associations' do
    it { is_expected.to have_many(:products) }
    it { is_expected.to have_many(:shipping_methods) }
    it { is_expected.to have_many(:stock_locations) }
    it { is_expected.to have_many(:vendor_users) }
    it { is_expected.to have_many(:users).through(:vendor_users) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'initial state' do
    it 'initial state should be pending' do
      should be_pending
    end
  end
end
