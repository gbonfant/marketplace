require 'spec_helper'
require 'product'
require 'checkout'
require 'large_purchase_discount'
require 'bulk_purchase_discount'

describe 'Checkout process' do
  let(:promotion_rules) { [BulkPurchaseDiscount.new, LargePurchaseDiscount.new] }
  let(:lavender) { { code: '001', price: 9.25, name: 'Lavender heart' } }
  let(:cufflinks) { { code: '002', price: 45.00, name: 'Personalised cufflinks' } }
  let(:kids_tshirt) { { code: '003', price: 19.95, name: 'Kids T-shirt' } }

  context 'given a basket with the following products: 001, 002, 003' do
    it 'calculates the basket total price' do
      # Basket: 001,002,003
      # Total price expected: 66.78
      checkout = Checkout.new(promotion_rules)

      checkout.scan Product.new(lavender)
      checkout.scan Product.new(cufflinks)
      checkout.scan Product.new(kids_tshirt)

      expect(checkout.total).to eq(66.78)
    end
  end

  context 'given a basket with the following products: 001, 003, 001' do
    it 'calculates the basket total price' do
      # Basket: 001,003,001
      # Total price expected: 36.95
      checkout = Checkout.new(promotion_rules)

      checkout.scan Product.new(lavender)
      checkout.scan Product.new(kids_tshirt)
      checkout.scan Product.new(lavender)

      expect(checkout.total).to eq(36.95)
    end
  end

  context 'given a basket with the following products: 001, 002, 001, 003' do
    it 'calculates the basket total price' do
      # Basket: 001,002,001,003
      # Total price expected: 73.76
      checkout = Checkout.new(promotion_rules)

      checkout.scan Product.new(lavender)
      checkout.scan Product.new(cufflinks)
      checkout.scan Product.new(lavender)
      checkout.scan Product.new(kids_tshirt)

      expect(checkout.total).to eq(73.76)
    end
  end
end
