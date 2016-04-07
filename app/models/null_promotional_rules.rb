class NullPromotionalRules
  include Enumerable

  def each(&block)
    [].each(&block)
  end

  def apply(products)
    products
  end
end
