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
            "destination": info
          }
        }
      end
    }
  end
end