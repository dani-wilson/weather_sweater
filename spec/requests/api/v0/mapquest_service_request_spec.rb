require "rails_helper"

RSpec.describe "Mapquest Service API", :vcr do
  describe "Mapquest Service" do
    describe "happy path" do
      it "can return location data" do
        response = MapquestService.search("cincinatti, oh")
        expect(response[:results][0][:providedLocation][:location]).to eq("cincinatti, oh")
        expect(response[:results][0][:providedLocation][:location]).to be_a(String)
        expect(response[:results][0][:locations][0][:latLng][:lat]).to eq(39.10713)
        expect(response[:results][0][:locations][0][:latLng][:lng]).to eq(-84.50413)
        expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
        expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
      end

      it "testing endpoint" do
        params = {
          location: 'denver,co'
        }
    
        headers = {
          'content-type': 'application/json',
          'Accept': 'application/json'
        }
    
        get '/api/v0/forecast', headers: headers, params: params

        expect(response).to be_successful
        expect(response.status).to eq(200)
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to have_key(:data)
        expect(parsed[:data]).to have_key(:id)
        expect(parsed[:data][:id]).to eq(nil)
        expect(parsed[:data]).to have_key(:attributes)
        expect(parsed[:data][:attributes]).to have_key(:current_weather)
        expect(parsed[:data][:attributes][:current_weather]).to have_key(:last_updated)
        expect(parsed[:data][:attributes][:current_weather][:last_updated]).to be_a(String)
        expect(parsed[:data][:attributes][:current_weather]).to have_key(:current_temperature)
        expect(parsed[:data][:attributes][:current_weather][:current_temperature]).to be_a(Float)
      end
    end
  end
end