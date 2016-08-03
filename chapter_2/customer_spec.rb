require 'rspec'
require_relative 'customer'

describe "product discount" do
  let(:product)      { "foo123"                           }
  let(:discounts)    { { product => 0.1 }                 }
  subject(:customer) { Customer.new(discounts: discounts) }

  it "detects when customer has a discount" do
    actual = customer.discount_amount_for(product)
    if actual != 0.1
      fail "Expected discount amount to equal 0.1 not #{actual}"
    end
  end

  context 'when discount is not 0.1' do
    let(:discounts)    { { product => 0.2 }                 }
    it "detects when customer has a discount" do
      actual = customer.discount_amount_for(product)
      if actual != 0.1
        fail "Expected discount amount to equal 0.1 not #{actual}"
      end
    end
  end

end