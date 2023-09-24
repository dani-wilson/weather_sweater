require "rails_helper"

RSpec.describe "Weather Service API", :vcr do
  describe "Weather Service" do
    describe "happy path" do
      it "can return weather data" do
        location = "Cincinatti,Oh"

        geo = MapquestService.search(location)
        coordinates = geo[:results][0][:locations][0][:latLng]

        weather = WeatherService.forecast_by_coordinates(coordinates)
        x = WeatherFacade.current_weather(coordinates)
        # require 'pry'; binding.pry
      end
    end
  end
end