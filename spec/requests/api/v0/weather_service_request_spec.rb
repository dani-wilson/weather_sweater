require "rails_helper"

RSpec.describe "Weather Service API", :vcr do
  describe "Weather Service" do
    describe "happy path" do
      it "can return weather data" do
        location = "Cincinatti,Oh"

        geo = MapquestService.search(location)
        coordinates = geo[:results][0][:locations][0][:latLng]

        weather = WeatherService.forecast_by_coordinates(coordinates)

        expect(weather[:location][:name]).to eq("Newport")
        expect(weather[:location][:name]).to be_a(String)
        expect(weather[:location][:region]).to eq("Kentucky")
        expect(weather[:location][:region]).to be_a(String)
        expect(weather[:location][:country]).to eq("United States of America")
        expect(weather[:location][:region]).to be_a(String)
        expect(weather[:location][:lat]).to eq(39.11)
        expect(weather[:location][:lon]).to eq(-84.5)
        expect(weather[:location][:lat]).to be_a(Float)
        expect(weather[:location][:lon]).to be_a(Float)
      end
    end
  end
end