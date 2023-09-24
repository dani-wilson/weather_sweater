class CurrentWeather 
  attr_reader :last_updated,
              :current_temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :current_condition,
              :current_icon

  def initialize(current_weather_data)
    @last_updated = current_weather_data[:last_updated]
    @current_temperature = current_weather_data[:current_temperature]
    @feels_like = current_weather_data[:feels_like]
    @humidity = current_weather_data[:humidity]
    @uvi = current_weather_data[:uvi]
    @visibility = current_weather_data[:visibility]
    @current_condition = current_weather_data[:current_condition]
    @current_icon = current_weather_data[:current_icon]
  end
end