class WeatherSerializer
include JSONAPI::Serializer
set_type :forecast
set_id 'null'
attributes :current_weather, :daily_weather, :hourly_weather
end