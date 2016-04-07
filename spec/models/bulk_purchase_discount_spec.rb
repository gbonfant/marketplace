require 'spec_helper'
require 'ostruct'
require 'bulk_purchase_discount'

describe BulkPurchaseDiscount do
  describe '#apply' do
    context 'when there are 2 or more promotional items in the basket' do
      it 'applies a discounted price to the promotional items' do
        products = [
          OpenStruct.new(name: 'Promo', price: 10.0, code: '001'),
          OpenStruct.new(name: 'Promo', price: 10.0, code: '001')
        ]

        discounted_products = described_class.new.apply(products)

        # Promo items are code 001
        # discounted price is 8.50
        expect(discounted_products.map(&:price)).to eq(17)
      end
    end

    context 'when there are NOT enough promotional items in the basket' do
      it 'does nothing' do
        products = [
          OpenStruct.new(name: 'Milk', price: 4.0, code: 'NOPROMO'),
          OpenStruct.new(name: 'Eggs', price: 2.0, code: 'NOPROMO')
        ]
        discounted_products = described_class.new.apply(products)

        expect(discounted_products).to eq(products)
      end
    end
  end
end
