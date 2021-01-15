class Book < Product

  def update(option)
    @title = option[:title]
    @author = option[:author_name]
  end

  def info
    "Книга: #{@title}, автор: #{@author}"
  end

# Переопределим метод чтения книги из консоли
  def read_from_console
    puts "Укажите название книги"
    @title = STDIN.gets.chomp

    puts "Укажите автора книги"
    @author = STDIN.gets.chomp
  end
#Переопределим метод to_xml

  def to_xml
    product = super
    product.add_element('book', {
        'title' => @title,
        'author_name' => @author
    }) # в тег product, который мы берем из родителя добавляем тег book и его атрибуты
    return product
  end

end
