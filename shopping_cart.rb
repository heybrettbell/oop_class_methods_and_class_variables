require_relative 'product.rb'

class ShoppingCart
  @@collection_of_products = []

  attr_accessor :product, :total_pre_tax, :total_post_tax

  def initialize
   @total_before_tax = 0
   @total_after_tax = 0
 end

  def add_product(name, base_price, tax_rate)
    product = Product.new(name, base_price, tax_rate)
    @@collection_of_products << product
    return product
  end

  def remove_product(name)
    @@collection_of_products.delete_at(name)
  end

  def total_cost_before_tax
    @@collection_of_products.each do |product|
    @total_before_tax += product.base_price
    end
  end

  def total_cost_after_tax
    @@collection_of_products.each do |product|
    @total_after_tax += product.total_price
    end
  end

  def self.contents #returns all the instances of @@the_cart
    @@collection_of_products
  end

end


a = ShoppingCart.new
a.add_product("laptop", 1500, 15)
a.add_product("jacket", 900, 13)
a.add_product("watch", 1200, 14)

# Cart.remove(1)
puts ShoppingCart.contents.inspect

puts a.total_cost_before_tax
puts a.total_cost_after_tax
