class HaveLollipopValueOf
  def initialize(lollipop_value)
    @expected = lollipop_value
  end

  def matches?(candy)
    @actual = candy.lollipop_value
    @actual == @expected
  end

  alias == matches? # only for deprecated customer.should syntax

  def failure_message
    "expected #{@expected}, but got #{@actual}"
  end
end
