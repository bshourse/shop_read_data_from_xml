class Book < Product

  def update(option)
    @title = option[:title]
    @author = option[:author_name]
  end

  def info
    "Книга: #{@title}, автор: #{@author}"
  end

end
