class OpenLibrary 
  attr_reader :total_books_found,
              :isbn,
              :title,
              :destination
  
  def initialize(book_data)
    @total_books_found = book_data[:total_books_found].to_i
    @isbn = book_data[:isbn]
    @title = book_data[:title]
    @destination = book_data[:destination]
  end
end