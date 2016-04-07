class Checkout
  def initialize(promotional_rules = nil)
    @products = []
    @promotional_rules = promotional_rules
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
    promotional_rules.apply(@products)
  end
end
