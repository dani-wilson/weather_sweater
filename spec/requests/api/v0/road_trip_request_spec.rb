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
    end
  end
end