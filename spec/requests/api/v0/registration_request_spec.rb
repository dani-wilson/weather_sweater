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
      expect(parsed[:data][:attributes]).to_not have_key(:password)
      expect(parsed[:data][:attributes]).to_not have_key(:password_confirmation)
    end

    it "sad path - user already exists" do
      User.create!(email: "sadpath@gmail.com", password: 'password1', password_confirmation: 'password1')

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      params = {
        "email": "sadpath@gmail.com",
        "password": "password1",
        "password_confirmation": "password1"
      }

      body = JSON.generate(params)
  
      post '/api/v0/users', headers: headers, params: body

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:error]).to eq('An account with this email already exists')
    end

    it "sad path - passwords don't match" do
      params = {
        "email": "sadpath2@gmail.com",
        "password": "password1",
        "password_confirmation": "password12"
      }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      
      body = JSON.generate(params)
      
      post '/api/v0/users', headers: headers, params: body
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:error]).to eq('Passwords do not match')
    end

    it "sad path - fields cannot be blank" do
      params = {
        "email": "sadpath3@gmail.com",
        "password": "password1"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      body = JSON.generate(params)
  
      post '/api/v0/users', headers: headers, params: body

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:error]).to eq('Missing required information: Fields cannot be blank')
    end
  end
end