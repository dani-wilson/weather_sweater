class WeatherFacade
  class << self

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

    def daily_weather(coordinates)
      get_location_data(coordinates)[:forecast][:forecastday].map do |forecast|
      data = {
        date: forecast[:date]
        sunrise: forecast[:astro][:sunrise]
        sunset: forecast[:astro][:sunrise]
        max_temp: forecast[:day][:maxtemp_f]
        min_temp: forecast[:day][:mintemp_f]
        daily_conditions: forecast[:day][:conditions][:text]
        daily_icon: forecast[:day][:conditions][:icon]
      }
      DailyWeather.new(data)
    end

    def hourly_weather(coordinates)
      get_location_data(coordinates)[:forecast][:forecastday][0].map do |forecast|
        forecast[1][1].map do |times|
        data = {
          time: times[3][:time]
          temperature: times[3][:temp_f]
          conditions: times[3][:condition][:text]
          icon: times[3][:condition][:icon]
        }
      end
    end

    def get_location_data(coordinates)
      WeatherService.forecast_by_coordinates(coordinates)
    end

    def geocode_service(location)
      MapquestService.search(location)
    end
  end
end