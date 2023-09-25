require "rails_helper"

RSpec.describe DailyWeather do
  it "exists and has attributes" do
    data = {
      "date": "2023-09-24",
      "sunrise": "07:27 AM",
      "sunset": "07:32 PM",
      "max_temp": "83.5",
      "min_temp": "57.0",
      "daily_conditions": "Sunny",
      "daily_icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
    }

    daily = DailyWeather.new(data)

    expect(daily).to be_a DailyWeather
    expect(daily.date).to eq("2023-09-24")
    expect(daily.sunrise).to eq("07:27 AM")
    expect(daily.sunset).to eq("07:32 PM")
    expect(daily.max_temp).to eq(83.5)
    expect(daily.min_temp).to eq(57.0)
    expect(daily.daily_conditions).to eq("Sunny")
    expect(daily.daily_icon).to eq("//cdn.weatherapi.com/weather/64x64/day/113.png")
  end
end