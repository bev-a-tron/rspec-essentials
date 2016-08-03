class Candy
  def initialize
    @lollipop_value = 1
  end

  def lollipop_value
    @lollipop_value ||= 100
  end
end
