class Customer
  def initialize(opts)
    # assume opts = { discounts: { "a" => 0.1, "b" => 0.2 } }
    @discounts = opts[:discounts]
  end

  def has_discount_for?(product_code)
    @discounts.has_key?(product_code)
  end

  def discount_amount_for(product_code)
    @discounts[product_code] || 0
  end

  def lollipop?
    true
  end

  def is_cat?
    true
  end

  def name
    'Lou'
  end
end
