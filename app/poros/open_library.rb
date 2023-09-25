class OpenLibrary 
  attr_reader :total_books_found,
              :isbn,
              :title,
              :destination,
              :summary,
              :temperature
  
  def initialize(book_data)
    @total_books_found = book_data[:total_books_found].to_i
    @isbn = book_data[:isbn]
    @title = book_data[:title]
    @destination = book_data[:destination]
    @summary = book_data[:summary]
    @temperature = book_data[:temperature].to_f
  end
end