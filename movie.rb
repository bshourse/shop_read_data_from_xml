class Movie < Product

  def update(options)
    @title = options[:title]
    @director_name = options[:director_name]
    @year = options[:year]
  end

  def info
    "Фильм #{@title}, режиссер - #{@director_name}, год - #{@year}"
  end

end
