require 'spec_helper'
require 'checkout'
require 'product'

describe Checkout do
  describe '#scan' do
    it 'appends the given product to a collection' do
      product = Product.new(name: 'Foo', price: 1.0, code: '000')
      checkout = described_class.new

      expect(checkout.scan(product)).to eq([product])
    end
  end

  describe '#total' do
    it 'calculates the total price from all the products added' do
      lavender = Product.new(name: 'Lavender heart', price: 2.5, code: '001')
      soap_bar = Product.new(name: 'Soap Bar', price: 5.0, code: '003')
      checkout = described_class.new

      checkout.scan(soap_bar)
      checkout.scan(lavender)

      expect(checkout.total).to eq(7.5)
    end
  end
end
