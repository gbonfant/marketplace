require 'spec_helper'
require 'product'

describe Product do
  describe '#name' do
    it 'returns the product name' do
      product = described_class.new(name: 'Lavender heart', price: 2.5, code: '001')

      expect(product.name).to eq('Lavender heart')
    end
  end
  describe '#price' do
    it 'returns the product price' do
      product = described_class.new(name: 'Let it go CD', price: 3.5, code: '002')

      expect(product.price).to eq(3.5)
    end
  end

  describe '#code' do
    it 'returns the product code' do
      product = described_class.new(name: 'Detergent', price: 5.0, code: '003')

      expect(product.code).to eq('003')
    end
  end
end
