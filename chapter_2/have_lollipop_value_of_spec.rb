require 'rspec'
require_relative 'candy'
require_relative 'have_lollipop_value_of'

describe "lollipop value" do
  def have_lollipop_value_of(value)
    HaveLollipopValueOf.new(value)
  end

  subject(:candy) { Candy.new }

  it "detects when candy has lollipop value" do
    expect(candy).to have_lollipop_value_of(1)
  end
end
