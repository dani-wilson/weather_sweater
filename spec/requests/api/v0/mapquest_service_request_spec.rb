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
    end
  end
end