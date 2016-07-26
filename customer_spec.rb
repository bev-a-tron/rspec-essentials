RSpec::Matchers.define :be_discounted do |product, expected|
  match do |customer|
    customer.discount_amount_for(product) == discount
  end
end

describe "product discount" do
  let(:product)      { "foo123"                           }
  let(:discounts)    { { product => 0.1 }                 }
  subject(:customer) { Customer.new(discounts: discounts) }

  it "detects when customer has a discount" do
    expect(customer).to be_discounted(product, 0.1)
  end
end
