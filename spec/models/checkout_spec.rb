require 'checkout'

describe Checkout do
  describe '#scan' do
    it 'appends the given product to a collection' do
      checkout = described_class.new

      expect(checkout.scan(2)).to eq([2])
    end
  end
end
