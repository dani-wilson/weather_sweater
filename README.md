# Weather-Sweater

Whether-Sweater is a backend application designed to satisfy the needs of a front-end team who are developing an application to create a road trip weather planning app. This application builds out the endpoints based off the wireframes supplied by the front-end.

## About the Project
Whether Sweater is a 5-day solo project during module 3 of Turing School's Back-End Engineering Program.

This application is a web application designed to consume and produce APIs. The application utilizes Ruby on Rails, with a PostgrSQL database.

### Built With
- [Ruby 3.2.2](https://github.com/ruby/ruby)
- [Rails 7.0.8](https://github.com/rails/rails)
- [postgresql](https://github.com/postgres/postgres)

### Getting Started
To use Whether-Sweater locally, you can fork and clone [this](https://github.com/dani-wilson/weather_sweater) repo

### Configuration
1. Clone this repo
2. cd into the directory where it was cloned and launch code editor
3. run `bundle install` to install gems and dependencies
4. Run `rails db:{create,migrate}` to setup the database

This application uses 2 different APIs. In your command line, use `EDITOR="code --wait" bin/rails credentials:edit` to open your encrypted credentials file. Then set up your api keys like this:

`weather:`</br>
  `api_key: <YOUR API KEY>`

  ### Testing
  To test the full suite, run `bundle exec rspec`
  To see a full coverage report with SimpleCov, use `open coverage/index.html`



  ### Endpoint use
  Endpoints can be tested in Postman using localhost:3000<br>
  Endpoints are as follows:
  1. Get weather for a city<br>
    - GET /api/v0/forecast<br>
    - params: [location] = [your location]

  2. User registration<br>
    - POST /api/v0/users</br>
    - send your registration params through the body of the request in JSON, example:<br></br>
    `{`<br>
        `"email": "whatever@example.com",`<br>
        `"password": "password",`<br>
        `"password_confirmation": "password"`<br>
    `}`
<br><br>Upon user registration, you will be given an api key

  3. Login, using the same email and password as in step 2<br>
    - POST /api/v0/sessions
  4. Get information to plan a roadtrip<br>
    - POST /api/v0/road_trip<br>
    Similar to step 2, you'll send your request like this, with these three parameters<br><br>
    `{`<br>
      `"origin": "Cincinatti,OH",`<br>
      `"destination": "Chicago,IL",`<br>
     ` "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"`<br>
     ` }`


