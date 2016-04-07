require 'spec_helper'
require 'checkout'

describe Checkout do
  describe '#scan' do
    it 'appends the given product to a collection' do
      checkout = described_class.new

      expect(checkout.scan(2)).to eq([2])
    end
  end

  describe '#total' do
    it 'calculates the total price from all the products added' do
      checkout = described_class.new

      checkout.scan(1)
      checkout.scan(2)

      expect(checkout.total).to eq(3)
    end
  end
end
