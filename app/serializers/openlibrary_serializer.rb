class OpenlibrarySerializer
  def initialize(books_info)
    @books_info = books_info
  end

  def as_json
    {
      "data": @books_info.map do |info|
        {
          "id": "null",
          "type": "books",
          "attributes": {
            "destination": info.destination,
            "forecast": {
              "summary": info.summary,
              "temperature": info.temperature
            },
            "total_books_found": info.total_books_found,
            "books": [
              {
                "isbn": [
          info.isbn
                ],
                "title": info.title
              }
            ]
          }
        }
      end
    }
  end
end