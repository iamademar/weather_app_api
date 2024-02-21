# README



## Weather Data API Documentation

The Weather Data API provides access to real-time weather information for cities around the world. It utilizes data from OpenWeatherMap, the API returns current [weather information](https://openweathermap.org/current#example_JSON).


## Versions
- [V3](https://github.com/iamademar/weather_app_api/releases/tag/v3.0)
- [V2](https://github.com/iamademar/weather_app_api/releases/tag/v2.0)
- [V1](https://github.com/iamademar/weather_app_api/releases/tag/v1.0)


### Base URL
The base URL for the API is: 
https://localhost:3000/

### Authentication
The API requires you to sign-up to access the Weather Data endpoint.

### Endpoints

#### User Login
Authenticates a user and initiates a session.
- HTTP Method: POST
- Endpoint: /login
- No Query Parameters
- Body Parameters:
  - email: User's email address (required)
  - password: User's password (required)
- Response: JSON object containing user data and session information

Request Example:
```
curl -X POST "http://localhost:3000/login" -d "email=user@example.com&password=yourpassword"
```

***

#### User Logout
Terminates a user's session.
- HTTP Method: DELETE
- Endpoint: /logout
- No Query Parameters or Body Parameters
- Response: JSON object containing a message that the user has been logged out

Request Example:
```
curl -X DELETE "http://localhost:3000/logout"
```

#### User Registration
Registers a new user.
- HTTP Method: POST
- Endpoint: /signup
- No Query Parameters
- Body Parameters:
  - email: User's email address (required)
  - password: User's password (required)
- Response: JSON object containing the newly created user data

Request Example:
```
curl -X POST "http://localhost:3000/signup" -d "email=newuser@example.com&password=newpassword"
```

***

#### Get Weather Data for a City
Retrieves the current weather data for a specified city.

- HTTP Method: GET
- Endpoint: /weather
- Query Parameters:
  - city: Name of the city (required)
- Response: JSON object containing weather data

Request Example:
```
curl "http://localhost:3000/weather/show?city=Colombo"
```

Or you can request via Postman
<img width="736" alt="Screenshot 2024-02-21 at 9 59 06 AM" src="https://github.com/iamademar/weather_app_api/assets/237025/43da4b33-8fb8-427a-8e93-75d036adb851">

### Error Handling
The API uses standard HTTP status codes to indicate the success or failure of requests:
- 200 OK: The request was successful.
- 400 Nothing to Geocode: The request was invalid. This usually occurs due to missing or incorrect query parameters.

### Rate Limiting
The API does not currently enforce rate limiting. However, excessive use may lead to temporary restrictions. Please use the API responsibly.

***

## Install and setup Rails app locally

### Step 1: Clone the Repository
First, clone the GitHub repository to your local machine. Open a terminal and run:
```
git clone https://github.com/iamademar/weather_app_api.git
cd weather_app_api
```

### Step 2: Install Dependencies
```
bundle install
```

### Step 4: Environment Variables
Creating a .env file in the root of your project and add a OPEN_WEATHER_MAP_API_KEY env variable.
You can get the OpenWeatherMap API keys [here](https://openweathermap.org/).


## Running Jaeger locally

### Step 1: Running Jaeger Locally
The easiest way to get Jaeger up and running locally is through Docker. If you don't have Docker installed, you'll need to download and install it from the Docker website.

Once Docker is ready, you can start the Jaeger all-in-one Docker container, which includes the Jaeger UI, collector, query, and agent, with a single command:
```
docker run -d --name jaeger \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  -p 5775:5775/udp \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 14268:14268 \
  -p 14250:14250 \
  -p 9411:9411 \
  jaegertracing/all-in-one:latest
```

This command will start Jaeger and expose its UI on http://localhost:16686. If this is setup correctly, you should automatically be able to observe the app's data when Jaeger is running.


## Related Blogs for more info
- https://blog.ademartutor.com/p/observability-with-opentelemetry
- https://blog.ademartutor.com/p/instrumentation-on-a-weather-api
