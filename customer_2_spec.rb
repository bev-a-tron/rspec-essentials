require 'rspec'
require_relative 'customer'

RSpec::Matchers.define :be_discounted do |hsh|
  match do |customer|
    @customer = customer
    @actual = hsh.keys.inject({}) do |memo, product, _|
      memo[product] = @customer.discount_amount_for(product)
      memo
    end

    differ = RSpec::Expectations.differ

    @difference = differ.diff_as_object(hsh, @actual)
    @difference == '' # blank diff means equality
  end

  failure_message do |actual|
    "Expected #{@customer} to have discounts:\n"  +
        "  #{actual.inspect}.\n"                      +
        "Diff: "                                      +
        @difference
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
    expect(customer).to be_discounted({a: 0.2, b: 0.4, c: 10})
  end

  it { is_expected.to be_lollipop }

  it { is_expected.to be_is_cat }

  it { is_expected.to be_named_lulu }

  it 'should be true' do
    expect(1.5).to be_within(0.5).of(1.8)
  end
end
