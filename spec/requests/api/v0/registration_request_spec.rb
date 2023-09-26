require "rails_helper"

RSpec.describe "Registration Requests", :vcr do
  describe "happy path" do
    it "can register a new user" do
      
      params = {
        "email": "dillpickles@gmail.com",
        "password": "password",
        "password_confirmation": "password"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      body = JSON.generate(params)
  
      post '/api/v0/users', headers: headers, params: body

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to be_a(String)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq("users")
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to have_key(:email)
      expect(parsed[:data][:attributes][:email]).to eq("dillpickles@gmail.com")
      expect(parsed[:data][:attributes][:email]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:api_key)
      expect(parsed[:data][:attributes][:api_key]).to be_a(String)
    end
  end
end