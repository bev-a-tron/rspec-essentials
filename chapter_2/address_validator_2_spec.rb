require 'rspec'
require_relative 'address_validator'

describe AddressValidator do
  let(:address) { {street: "123 Any Street", city: "Anytown"} }

  it "valid? returns false for incomplete address" do
    expect(AddressValidator.valid?(address)).to eq(false)
  end

  it "missing_parts returns an array of missing required parts" do
    expect(
        AddressValidator.missing_parts(address)
    ).to eq([:region, :postal_code, :country])
  end

  context "invalid characters in value" do

    let(:address){ {street: "123 Any Street", city: "Any$town%"} }

    it "invalid_parts returns keys with invalid values" do
      expect(
          AddressValidator.invalid_parts(address)
      ).to eq([:city])
    end
  end
end