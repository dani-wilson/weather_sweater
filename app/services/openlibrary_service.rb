class OpenlibraryService
  class << self
    def conn
      Faraday.new(url: "https://openlibrary.org/developers/api")
    end

    def get_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def book_search(location, quantity)
      response = conn.get '/search.json' do |req|
        req.params[:q] = location
        req.params[:quantity] = quantity
      end
      get_json(response)
    end
  end
end