class OpenlibraryFacade
  class << self

    def book_information(location, quantity)
      book_data = book_search(location, quantity)
      weather = get_forecast(location)
      iterations = book_search(location, quantity)[:docs].map do |iteration|
      data = {
        total_books_found: book_data[:numFound],
        isbn: iteration[:isbn],
        title: iteration[:title],
        destination: iteration[:title_sort],
        summary: weather[:current][:condition][:text],
        temperature: weather[:current][:temp_f]
      }
      OpenLibrary.new(data)
    end

    def get_forecast(location)
      WeatherService.forecast_by_location(location)
    end
  end
end