class WeatherFacade
  class << self

    def weather(location)
      data = {
        current_weather: current_weather(location),
        daily_weather: daily_weather(location),
        hourly_weather: hourly_weather(location)
      }
      Forecast.new(data, location)
    end

    def current_weather(location)
      coordinates = find_lat_and_lon(location)
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

    def daily_weather(location)
      coordinates = find_lat_and_lon(location)
      get_location_data(coordinates)[:forecast][:forecastday].map do |forecast|
        data = {
          date: forecast[:date],
          sunrise: forecast[:astro][:sunrise],
          sunset: forecast[:astro][:sunset],
          max_temp: forecast[:day][:maxtemp_f],
          min_temp: forecast[:day][:mintemp_f],
          daily_conditions: forecast[:day][:condition][:text],
          daily_icon: forecast[:day][:condition][:icon]
        }
        DailyWeather.new(data)
      end
    end

    def hourly_weather(location)
      coordinates = find_lat_and_lon(location)
      get_location_data(coordinates)[:forecast][:forecastday].map do |forecast|
        forecast[:hour].map do |times|
          data = {
            time: times[:time],
            temperature: times[:temp_f],
            conditions: times[:condition][:text],
            icon: times[:condition][:icon]
          }
          HourlyWeather.new(data)
        end
      end
    end

    def find_lat_and_lon(location)
      geocode = geocode_service(location)
      geocode[:results][0][:locations][0][:latLng]
    end

    def get_location_data(coordinates)
      WeatherService.forecast_by_coordinates(coordinates)
    end

    def geocode_service(location)
      MapquestService.search(location)
    end
  end
end