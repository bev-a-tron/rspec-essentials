require 'rspec'
require_relative 'customer'
require_relative 'have_discount_of'

describe "product discount" do
  # no need for the RSpec::Matchers.define DSL
  def have_discount_of(discount)
    HaveDiscountOf.new(discount)
  end

  let(:product)      { "foo123"                           }
  let(:discounts)    { { product => 0.1 }                 }

  subject(:customer) { Customer.new(discounts: discounts) }

  it "detects when customer has a discount" do
    expect(customer).to have_discount_of(0.1).for(product)
  end
end
