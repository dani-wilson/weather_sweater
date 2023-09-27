require "rails_helper"

RSpec.describe RoadTripForecast do
  it "exists and has attributes" do
    data = {
      "temperature": "74.3",
      "conditions": "Cloudy"
    }

    forecast = RoadTripForecast.new(data)

    expect(forecast).to be_a RoadTripForecast
    expect(forecast.temperature).to eq(74.3)
    expect(forecast.temperature).to be_a(Float)
    expect(forecast.conditions).to eq("Cloudy")
    expect(forecast.conditions).to be_a(String)
  end
end