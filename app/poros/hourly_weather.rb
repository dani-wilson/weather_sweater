class HourlyWeather 
  attr_reader   :time,
                :temperature,
                :conditions,
                :icon

  def initialize(hourly_weather_data)
    @time = format_time(hourly_weather_data)
    @temperature = hourly_weather_data[:temperature].to_f
    @conditions = hourly_weather_data[:conditions]
    @icon = hourly_weather_data[:icon]
  end

  def format_time(hourly_weather_data)
    datetime_str = hourly_weather_data[:time]
    time_portion = Time.parse(datetime_str).strftime("%H:%M")
    return time_portion
  end
end