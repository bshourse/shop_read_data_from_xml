require_relative 'product'
require_relative 'book'
require_relative 'movie'

products = Product.read_from_xml('data/product.xml')

Product.show(products)
