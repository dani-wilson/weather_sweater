class OpenlibraryFacade
  class << self

    def book_information(location, quantity)
      book_data = book_search(location, quantity)
      iterations = book_search(location, quantity)[:docs].map do |iteration|
      data = {
        total_books_found: book_data[:numFound],
        isbn: iteration[:isbn],
        title: iteration[:title]
        destination: iteration[:title_sort]
      }
      OpenLibrary.new(data)
    end
  end
end