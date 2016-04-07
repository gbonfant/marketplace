class Product
  attr_accessor :name, :price, :code, :promotion

  def initialize(name:, price:, code:)
    @name = name
    @code = code
    @price = price
  end
end
