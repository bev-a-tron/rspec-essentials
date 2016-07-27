require 'rspec'
require_relative 'customer'

RSpec::Matchers.define :be_discounted do |product, expected|
  match do |customer|
    customer.discount_amount_for(product) == expected
  end
end

RSpec::Matchers.define :be_named_lulu do
  match do |customer|
    @actual = customer.name
    actual == 'Lulu'
  end

  failure_message do |name|
    "expected Lulu, got #{name}"
  end
end

describe "product discount" do
  let(:product)      { "foo123"                           }
  let(:discounts)    { { product => 0.1 }                 }
  subject(:customer) { Customer.new(discounts: discounts) }

  it "detects when customer has a discount" do
    expect(customer).to be_discounted(product, 0.1)
  end

  it { is_expected.to be_lollipop }

  it { is_expected.to be_is_cat }

  it { is_expected.to be_named_lulu }

end
