require "rails_helper"

RSpec.describe "Road Trip Request Spec", :vcr do
  describe "happy path" do
    it "can plan a road trip" do
      params = {
        "origin": "Vernal,UT",
        "destination": "Astoria,OR",
        "api_key": "cMni51x6XDi5K3UN5vHuPTwU"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      body = JSON.generate(params)
  
      post '/api/v0/road_trip', headers: headers, params: body
      
      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to eq(nil)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq("road_trip")
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to have_key(:start_city)
      expect(parsed[:data][:attributes][:start_city]).to eq("Vernal,UT")
      expect(parsed[:data][:attributes]).to have_key(:end_city)
      expect(parsed[:data][:attributes][:end_city]).to eq("Astoria,OR")
      expect(parsed[:data][:attributes]).to have_key(:travel_time)
      expect(parsed[:data][:attributes][:travel_time]).to eq("14 hours 0 minutes")
      expect(parsed[:data][:attributes]).to have_key(:weather_at_eta)
      expect(parsed[:data][:attributes][:weather_at_eta]).to eq("Partly Cloudy")
    end
  end
end