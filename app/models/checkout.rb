class Checkout
  def initialize
    @products = []
  end

  def scan(product)
    @products << product
  end
end
