require "rails_helper"

RSpec.describe Forecast do
  it "exists and has attributes" do
    location = "Denver,CO"

    current_weather_data = {
      "last_updated": "2023-09-25",
      "current_temperature": "87.1",
      "feels_like": "90",
      "humidity": "23",
      "uvi": "0.9",
      "visibility": "15",
      "current_condition": "Blustery",
      "current_icon": "lkjsdf0983"
    }

    daily_weather_data = {
      "date": "2023-09-28",
      "sunrise": "07:13 AM",
      "sunset": "07:42 PM",
      "max_temp": "88",
      "min_temp": "55",
      "daily_conditions": "sunny",
      "daily_icon": "lksjd0983lksjdf"
    }

    hourly_weather_data = {
      "time": "2023-09-14 04:00",
      "temperature": "74",
      "conditions": "slightly rainy",
      "icon": "lkjsdf0934"
    }

    hourly = HourlyWeather.new(hourly_weather_data)
    daily = DailyWeather.new(daily_weather_data)
    current = CurrentWeather.new(current_weather_data)

    data = {
      current_weather: current,
      daily_weather: daily,
      hourly_weather: hourly
    }

    forecast = Forecast.new(data, location)

    expect(forecast).to be_a Forecast
    expect(forecast.location).to be_a(String)
    expect(forecast.hourly_weather.time).to eq("04:00")
    expect(forecast.hourly_weather.conditions).to eq("slightly rainy")
    expect(forecast.daily_weather.sunrise).to eq("07:13 AM")
  end 
end