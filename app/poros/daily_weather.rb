class DailyWeather 
  attr_reader   :date,
                :sunrise,
                :sunset,
                :max_temp,
                :min_temp,
                :daily_conditions,
                :daily_icon

  def initialize(daily_weather_data)
    @date = daily_weather_data[:date]
    @sunrise = daily_weather_data[:sunrise]
    @sunset = daily_weather_data[:sunset]
    @max_temp = daily_weather_data[:max_temp].to_f
    @min_temp = daily_weather_data[:min_temp].to_f
    @daily_conditions = daily_weather_data[:daily_conditions]
    @daily_icon = daily_weather_data[:daily_icon]
  end
end