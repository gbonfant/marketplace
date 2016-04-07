require_relative 'product'

class LargePurchaseDiscount
  def apply(products)
    if discount_applies?(products)
      total_price = products.map(&:price).reduce(:+)

      products << Product.new(name: '', code: '10OFF', price: -(total_price * 0.1).round(2))
    end

    products
  end

  private

  def discount_applies?(products)
    products.map(&:price).reduce(:+) > 60
  end
end
