class Checkout
  def initialize(promotional_rules = nil)
    @products = []
    @promotional_rules = promotional_rules
  end

  def scan(product)
    @products << product
  end

  def total
    @products.map(&:price).reduce(:+)
  end
end
