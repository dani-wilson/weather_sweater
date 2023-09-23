require "rails_helper"

RSpec.describe "Mapquest Service API", :vcr do
  describe "Mapquest Service" do
    describe "happy path" do
      it "can return location data" do
        get "/api/v0/forecast", params: { location: "cincinatti,oh" }
        require 'pry'; binding.pry
        expect(response.status).to eq(200)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["response"][0]["text"]).to be_a(String)
      end
    end
  end
end