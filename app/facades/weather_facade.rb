class WeatherFacade
  class << self
    # def weather(location)
    #   data = {
    #     current_weather: current_weather(location),
    #     daily_weather: daily_weather(location),
    #     hourly_weather: hourly_weather(location)
    #   }
    #   Forecast.new(data, location)
    # end

    def current_weather(coordinates)
      current_weather_data = get_location_data(coordinates)
      data = {
        last_updated: current_weather_data[:current][:last_updated],
        current_temperature: current_weather_data[:current][:temp_f],
        feels_like: current_weather_data[:current][:feelslike_f],
        humidity: current_weather_data[:current][:humidity],
        uvi: current_weather_data[:current][:uv],
        visibility: current_weather_data[:current][:vis_miles],
        current_condition: current_weather_data[:current][:condition][:text],
        current_icon: current_weather_data[:current][:condition][:icon]
      }
      CurrentWeather.new(data)
    end

    def daily_weather

    end

    def hourly_weather

    end

    def get_location_data(coordinates)
      WeatherService.forecast_by_coordinates(coordinates)
    end

    def geocode_service(location)
      MapquestService.search(location)
    end
  end
end