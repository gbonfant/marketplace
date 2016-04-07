require 'spec_helper'
require 'null_promotional_rules'

describe NullPromotionalRules do
  describe '#apply' do
    it 'returns the given products (noop)' do
      original_value = 'foo'
      return_value = described_class.new.apply(original_value)

      expect(return_value).to eq(original_value)
    end
  end
end
