class BulkPurchaseDiscount
  PRODUCT_CODE = '001'
  DISCOUNTED_PRICE = 8.50

  def apply(products)
    eligible_products = filter_eligible(products).first
    remaining_products = filter_eligible(products).last

    if discount_applies?(eligible_products)
      apply_discount(eligible_products, remaining_products)
    else
      products
    end
  end

  private

  def filter_eligible(products)
    products.partition { |product| product.code == PRODUCT_CODE }
  end

  def discount_applies?(eligible_products)
    eligible_products.size >= 2
  end

  def apply_discount(eligible_products, remaining_products)
    eligible_products.map do |product|
      product.price = DISCOUNTED_PRICE
      product.promotion = self.class.name

      product
    end + remaining_products
  end
end
