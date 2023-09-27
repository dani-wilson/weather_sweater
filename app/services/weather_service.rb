class WeatherService
  class << self

  def conn
    Faraday.new(url: "http://api.weatherapi.com/v1") do |f|
      f.params[:key] = Rails.application.credentials.weather[:api_key]
    end
  end
    
    def get_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
    
    def forecast_by_coordinates(coordinates)
      latitude = coordinates[:lat]
      longitude = coordinates[:lng]

      format_lat_lon = "#{latitude},#{longitude}"

      response = conn.get 'forecast.json' do |req|
        req.params[:q] = format_lat_lon
        req.params[:days] = 5
      end
      get_json(response)
    end

    def weather_by_eta(end_city, eta)
      response = conn.get 'future.json' do |req|
        req.params[:q] = end_city
        req.params[:dt] = eta
      end
    end
  end
end