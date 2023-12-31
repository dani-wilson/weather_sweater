require "rails_helper"

RSpec.describe RoadTrip do
  it "exists and has attributes" do
    data = {
      "start_city": "Vernal,UT",
      "end_city": "Astoria,OR",
      "travel_time": "53708",
      "weather_at_eta": {
        "datetime": "2023-09-26 20:07",
        "conditions": "light rain",
        "temperature": "42.1"
      }
    }

    road_trip = RoadTrip.new(data)

    expect(road_trip).to be_a RoadTrip
    expect(road_trip.start_city).to eq("Vernal,UT")
    expect(road_trip.end_city).to eq("Astoria,OR")
    expect(road_trip.travel_time).to eq("14 H 55 m")
    expect(road_trip.weather_at_eta[:datetime]).to eq("2023-09-26 20:07")
    expect(road_trip.weather_at_eta[:conditions]).to eq("light rain")
    expect(road_trip.weather_at_eta[:temperature]).to eq("42.1")
  end
end