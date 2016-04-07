require 'spec_helper'
require 'ostruct'
require 'large_purchase_discount'

describe LargePurchaseDiscount do
  describe '#apply' do
    context 'when the total price exceeds 60 GBP' do
      it 'applies a 10% discount promotion' do
        products = [
          OpenStruct.new(name: 'Expensive CD', price: 65),
          OpenStruct.new(name: 'Expensive Bread', price: 22)
        ]
        discounted_products = described_class.new.apply(products)

        # (65 + 22) * 0.10 = 8.7
        expect(discounted_products.last).to include(price: -8.7)
      end
    end

    context 'when the total price DOES NOT exceed 60 GBP' do
      it 'does nothing' do
        products = [
          OpenStruct.new(name: 'CD', price: 9.99),
          OpenStruct.new(name: 'Bread', price: 1.52)
        ]
        discounted_products = described_class.new.apply(products)

        expect(discounted_products).to eq(products)
      end
    end
  end
end
