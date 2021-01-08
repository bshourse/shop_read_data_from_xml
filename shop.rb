require_relative 'product'
require_relative 'book'
require_relative 'movie'

products = Product.read_from_xml('data/product.xml')

choice = nil
total_price = 0

while choice != 'x' do
Product.show(products)

choice = STDIN.gets.chomp

if choice != 'x' && choice.to_i < products.size && choice.to_i >= 0
  product = products[choice.to_i]
  total_price += product.buy
end
end

puts "Спасибо за покупки, c Вас #{total_price} рублей!"
