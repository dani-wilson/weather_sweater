class MapquestService
  class << self
    def conn
      Faraday.new(url: "https://www.mapquestapi.com") do |f|
        f.params[:key] = Rails.application.credentials.mapquest[:api_key]
      end
    end

    def get_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def search(location)
      response = conn.get '/geocoding/v1/address' do |req|
        req.params[:location] = location
      end
      get_json(response)
    end

    def estimated_time(origin, destination)
      response = conn.get '/directions/v2/routematrix' do |req|
        req.params[:from] = origin
        req.params[:to] = destination
      end
      get_json(response)
    end
  end
end