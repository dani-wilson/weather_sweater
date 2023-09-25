require "rails_helper"

RSpec.describe OpenlibrarySerializer do
  describe "#as_json" do
    it "returns the correct JSON structure", :vcr do
      location = "Denver, Co"
      quantity = 5

      book_info = OpenlibraryFacade.book_information(location, quantity)
      result = OpenlibrarySerializer.new(book_info).as_json

      expect(result[:data].count).to eq(5)

      result[:data].each do |info|
        expect(info).to have_key(:type)
        expect(info[:type]).to eq("books")

        expect(info).to have_key(:id)
        expect(info[:id]).to eq("null")
        expect(info).to have_key(:attributes)
        expect(info[:attributes]).to be_a(Hash)
        expect(info[:attributes]).to have_key(:destination)
        expect(info[:attributes][:destination]).to be_a(String)
        expect(info[:attributes]).to have_key(:forecast)
        expect(info[:attributes][:forecast]).to have_key(:summary)
        expect(info[:attributes][:forecast]).to have_key(:temperature)
        expect(info[:attributes][:forecast][:summary]).to be_a(String)
        expect(info[:attributes][:forecast][:temperature]).to be_a(Float)
        expect(info[:attributes]).to have_key(:books)
        expect(info[:attributes][:books]).to be_an(Array)
        expect(info[:attributes][:books][0]).to have_key(:isbn)
        expect(info[:attributes][:books][0]).to have_key(:title)
        expect(info[:attributes][:books][0][:title]).to be_a(String)
      end
    end
  end
end