#Напишите программу, которая спрашивает у пользователя,
# какой продукт он хочет добавить и в зависимости от выбора просит у него дополнительно
# ввести соответствующие поля.

require 'rexml/document'

require_relative 'product'
require_relative 'book'
require_relative 'movie'

# Метод product_types возвращает нам массив всех детей Product

product_types = Product.product_types

# Спрсим пользователя какой продукт он хочет добавить

choice = -1

until (0..product_types.count).include?(choice)
  puts "Какой товар вы хотите добавить?"
  product_types.each_with_index do |name, index|
    puts "#{index}: #{name}"
  end
  choice = STDIN.gets.chomp.to_i
end

# Попросим у пользователя указать цены и остаток

puts "Укажите стоимость продукта в рублях"
price = STDIN.gets.chomp.to_i

puts "Укажите сколько единиц товара осталось на складе"
amount_available = STDIN.gets.chomp.to_i

# Создадим выбранный продукт
# Достанем объект из массива по индексу и вызовем метод new и передадим параметры price и amount

product = product_types[choice].new(price, amount_available)

# Теперь вызовем у объекта метод read_from_console (который дополнит необходимыми полями объект)

product.read_from_console

# Сохраним новый продукт в файл с продуктами вызвав метод save_to_xml

product.save_to_xml('data/product.xml')

puts 'Данные сохранены в файл!'

