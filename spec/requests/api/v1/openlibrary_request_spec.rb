require "rails_helper"

RSpec.describe "OpenLibrary Service API", :vcr do
  describe "OpenLibrary Service" do
    describe "happy path" do
      it "can fetch destination city, forecast for the city, total search results, and quantity of book about the destination city" do
        response = OpenlibraryService.book_search("denver, co", 5)
        expect(response[:numFound]).to eq(772)
        expect(response[:numFound]).to be_an(Integer)
        expect(response[:docs][1][:title]).to eq("Denver west, CO and Bailey, CO: Denver, CO")
        expect(response[:docs][1][:title]).to be_a(String)
        expect(response[:docs][1][:isbn]).to be_an(Array)
        expect(response[:docs][1][:isbn][1]).to eq("0607620056")
        expect(response[:docs][1][:isbn][1]).to be_a(String)
      end
    end
  end
end