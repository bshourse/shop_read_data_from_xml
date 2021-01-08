class Product

  require 'rexml/document'

  def initialize(price, count)
    @price = price
    @count = count
  end

  #Тут создадим абстрактный метод, который будет реализован в других классах
  # с учетом своих атрибутов, которые нужны отобразаить

  def info
  end

  def show_price_value
    "#{info} - стоимость: #{@price}, осталось в наличии: #{@count}"
  end

  #создадим статический метод который будет спрашивать что хотим купить
  # и выводить собственно список продуктов что у нас есть из тех что
  # мы подготовили в методе read_from_xml, передав в качестве параметра в новый метод show
  # переменную в которой мы сохраняем результат вызова метода read_from_xml (в основной программе)

  def self.show(products)
    puts "Что хотите купить?"
    products.each_with_index do |value, index|
      puts "#{index}. #{value.show_price_value}"
    end
  end
  #создаем статический метод, с параметром в котором передаем
  #имя xml файла при вызове данного метода в основной программе

  def self.read_from_xml(file)
    #указываем путь до файла, который в последствии будем парсить
    file_path = File.dirname(__FILE__ ) + '/' + file
    #теперь нам нужно его открыть
    file_open = File.new(file_path)
    #теперь нам нужно передать его xml парсеру
    doc = REXML::Document.new(file_open)
    #закрываем файл ибо он нам больше не нужен
    #теперь он лежит в переменной doc, начнем работать с ней
    file_open.close
    #достанем информацию из файла к примеру из тега <product>
    result=[]
    products = nil
    doc.elements.each('products/product') do |element|
      price = element.attributes['price']
      amount = element.attributes['amount_available']
      #ok, в цикле мы получили значения всех атрибутов price и amount_available
      # и записали их в переменные

      #теперь я хочу достать значения атрибутов title и author_name
      #оказавшись внутри тега <product> проходимся циклом по временной
      # переменной element и вытаскиваем эти атрибуты у тега book
      element.elements.each('book') do |b|
        #внутри цикла создадим наш объект класса Book и передадим туда значения наших
        # атрибутов
        products = Book.new(price,amount)
        products.update(title: b.attributes['title'], author_name: b.attributes['author_name'])
      end

      element.elements.each('movie') do |m|
        #внутри этого цикла создадим объект класса Movie и передадим туда значени наших
        # атрибутов
        products = Movie.new(price,amount)
        products.update(title: m.attributes['title'], director_name: m.attributes['director_name'], year: m.attributes['year'])
      end

      #положим значения переменной result в массив products
      result << products
    end
    return result
  end
end
