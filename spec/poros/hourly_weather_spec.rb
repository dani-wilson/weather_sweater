require "rails_helper"

RSpec.describe HourlyWeather do 
  it "exists and has attributes" do
    data = {
      "time": "2023-09-24 01:00",
      "temperature": "62.1",
      "conditions": "Clear",
      "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
    }

    hourly = HourlyWeather.new(data)

    expect(hourly).to be_an HourlyWeather
    expect(hourly.time).to eq("01:00")
    expect(hourly.temperature).to eq(62.1)
    expect(hourly.conditions).to eq("Clear")
    expect(hourly.icon).to eq("//cdn.weatherapi.com/weather/64x64/night/113.png")
  end
end