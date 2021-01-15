class Movie < Product

  def update(options)
    @title = options[:title]
    @director_name = options[:director_name]
    @year = options[:year]
  end

  def info
    "Фильм #{@title}, режиссер - #{@director_name}, год - #{@year}"
  end

  # Переопределим метод чтения фильма из консоли
  def read_from_console
    puts "Введите название фильма"
    @title = STDIN.gets.chomp

    puts "Введите ФИО режисера"
    @director_name = STDIN.gets.chomp

    puts "Введите год создания фильма"
    @year = STDIN.gets.chomp
  end

  #Переопределим метод to_xml
  def to_xml
    product = super
    product.add_element('movie', {
        'title' => @title,
        'director_name' => @director_name,
        'year' => @year
    }) #добавляем тег movie и его атрибуты
    return product
  end
end
