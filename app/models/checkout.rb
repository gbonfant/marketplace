require 'null_promotional_rules'

class Checkout
  def initialize(*promotional_rules)
    @products = []
    @promotional_rules = promotional_rules || NullPromotionalRules.new
  end

  def scan(product)
    @products << product
  end

  def total
    discounted_products = apply_promotional_rules

    discounted_products.map(&:price).reduce(:+)
  end

  private

  attr_reader :promotional_rules

  def apply_promotional_rules
    promotional_rules.flatten.each_with_object(@products) do |promo_rule, discounted_products|
      promo_rule.apply(discounted_products)
    end
  end
end
