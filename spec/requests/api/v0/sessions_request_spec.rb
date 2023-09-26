require "rails_helper"

RSpec.describe "creating a user session", :vcr do
  describe "happy path" do
    it "can log in" do
      params = {
        "email": "newsession@gmail.com",
        "password": "password1",
        "password_confirmation": "password1"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      body = JSON.generate(params)
  
      post '/api/v0/users', headers: headers, params: body

      params = {
        "email": "newsession@gmail.com",
        "password": "password1",
        "password_confirmation": "password1"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      body = JSON.generate(params)
  
      post '/api/v0/sessions', headers: headers, params: body

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to be_a(Hash)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to be_a(String)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq("users")
      expect(parsed[:data][:attributes]).to be_a(Hash)
      expect(parsed[:data][:attributes]).to have_key(:email)
      expect(parsed[:data][:attributes][:email]).to eq("newsession@gmail.com")
      expect(parsed[:data][:attributes]).to have_key(:api_key)
      expect(parsed[:data][:attributes][:api_key]).to be_a(String)
    end
  end
end