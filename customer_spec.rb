require 'rspec'
require_relative 'customer'

describe "product discount" do
  let(:product)      { "foo123"                           }
  let(:discounts)    { { product => 0.1 }                 }
  subject(:customer) { Customer.new(discounts: discounts) }

  it "detects when customer has a discount" do
    actual = customer.discount_amount_for(product)
    expect(actual).to eq(0.1)
  end
end
