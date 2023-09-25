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
    @current_temperature = current_weather_data[:current_temperature].to_f
    @feels_like = current_weather_data[:feels_like].to_f
    @humidity = current_weather_data[:humidity].to_f
    @uvi = current_weather_data[:uvi].to_f
    @visibility = current_weather_data[:visibility].to_f
    @current_condition = current_weather_data[:current_condition]
    @current_icon = current_weather_data[:current_icon]
  end
end