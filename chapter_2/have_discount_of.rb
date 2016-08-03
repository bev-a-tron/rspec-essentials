class HaveDiscountOf

  def initialize(expected_discount)
    @expected = expected_discount
  end

  def matches?(customer)
    @actual = customer.discount_amount_for(@product)
    @actual == @expected
  end

  alias == matches? # only for deprecated customer.should syntax

  def for(product)
    @product = product
    self
  end

  def failure_message
    "expected #{@product} discount of #{@expected}, got #{@actual}"
  end
end
