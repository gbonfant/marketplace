require 'spec_helper'
require 'product'
require 'checkout'
require 'large_purchase_discount'

describe Checkout do
  describe '#scan' do
    it 'appends the given product to a collection' do
      product = Product.new(name: 'Foo', price: 1.0, code: '000')
      checkout = described_class.new

      expect(checkout.scan(product)).to eq([product])
    end
  end

  describe '#total' do
    context 'when no promotional rules are present' do
      it 'calculates the total price from all the products added' do
        lavender = Product.new(name: 'Lavender heart', price: 2.5, code: '001')
        soap_bar = Product.new(name: 'Soap Bar', price: 5.0, code: '003')
        checkout = described_class.new

        checkout.scan(soap_bar)
        checkout.scan(lavender)

        expect(checkout.total).to eq(7.5)
      end
    end

    context 'when one promotional rule is present' do
      it 'calculates the total price based on the promotional rule' do
        promotional_rule = LargePurchaseDiscount.new
        checkout = described_class.new(promotional_rule)

        checkout.scan Product.new(code: '000', name: 'Expensive CD', price: 59)
        checkout.scan Product.new(code: '012', name: 'Expensive milk', price: 11)
        checkout.scan Product.new(code: '12E', name: 'Cheap printer', price: 2.10)

        # Apply 10% discount on orders over 60 GBP
        # (59 + 11 + 2.10) = 72.10
        # 72.10 - (72.10 * 0.10) = 64.89
        expect(checkout.total).to eq(64.89)
      end
    end

    context 'when several promotional rules are present'
  end
end
