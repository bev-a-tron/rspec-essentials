require 'rspec'
require_relative 'simple_mock'

class ShoppingCart
  def total_price
    products.inject(0) do |sum, product|
      sum += product.price
    end
  end
end

class Product
end


RSpec.describe ShoppingCart do
  describe '#total_price' do
    it "returns the sum of the prices of all products" do
      num_products  = 22
      price         = 100
      cart          = ShoppingCart.new
      some_products = [Product.new] * num_products

      ShoppingCart.mock(:products, some_products) do
        Product.mock(:price, price) do
          expect(cart.total_price).to eq(num_products * price)
        end
      end
    end
  end
end
