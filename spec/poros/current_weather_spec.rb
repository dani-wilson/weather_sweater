require "rails_helper"

RSpec.describe CurrentWeather do 
  it "exists and has attributes" do
    data = {
      "last_updated": "2023-09-14 14:30",
      "current_temperature": "79.0",
      "feels_like": "80.2",
      "humidity": "45",
      "uvi": "7.0",
      "visibility": "9.0",
      "current_condition": "Sunny",
      "current_icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
    }

    current = CurrentWeather.new(data)

    expect(current).to be_a CurrentWeather
    expect(current.last_updated).to eq("2023-09-14 14:30")
    expect(current.current_temperature).to eq(79.0)
    expect(current.feels_like).to eq(80.2)
    expect(current.humidity).to eq(45)
    expect(current.uvi).to eq(7.0)
    expect(current.visibility).to eq(9.0)
    expect(current.current_condition).to eq("Sunny")
    expect(current.current_icon).to eq("//cdn.weatherapi.com/weather/64x64/day/113.png")
  end
end