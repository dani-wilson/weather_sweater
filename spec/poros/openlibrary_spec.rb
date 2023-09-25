require "rails_helper"

RSpec.describe OpenLibrary do
  it "exists and has attributes" do
    data = {
      "destination": "Denver, Co",
      "summary": "Cloudy",
      "temperature": "87.1",
      "total_books_found": "772",
      "isbn": ["0762507845", "9780762507849"],
      "title": "Denver, CO"
    }

    book_info = OpenLibrary.new(data)

    expect(book_info).to be_an OpenLibrary
    expect(book_info.destination).to eq("Denver, Co")
    expect(book_info.destination).to be_a(String)
    expect(book_info.total_books_found).to eq(772)
    expect(book_info.total_books_found).to be_an(Integer)
    expect(book_info.isbn).to be_an(Array)
    expect(book_info.isbn).to eq(["0762507845", "9780762507849"])
    expect(book_info.title).to eq("Denver, CO")
    expect(book_info.title).to be_a(String)
    expect(book_info.summary).to eq("Cloudy")
    expect(book_info.summary).to be_a(String)
    expect(book_info.temperature).to eq(87.1)
    expect(book_info.temperature).to be_a(Float)
  end
end

