# GeoWeatherFeature Feature Documentation
## overview/
    this feature manages fetching  current , forecast weather based on the user's location and predict status of weather (for more Details Check /docs/get_prediction.md)

## Architecture (CLEAN ARCH and Follows MVVM Pattern)/
## core
### network
 `/api_service.dart`
    ApiService class using DIO package to make a API requests  for 
    retrieving  weather data
### location
 `/get_location.dart`
    GetLocation class using Location package to determine user's location 
## Lib
###  /Data Layer 
### Manages Authentication Data
 `RemoteDataSource` → Handles retrieving and sending weather data to/from the Weather API ,AI Model
 `RemoteRepositoryImpl` → Implements `WeatherRepository`.

###  /Domain Layer
### Contains BusinessLogic 
 `WeatherRepository` => Abstract Repositry Interface
 `GetWeatherUseCase` → Handles retrieving weather data from the Weather API
 `GetPredictionUseCase` → Handles predicting weather status


### /Presentation Layer**
### Handels UI , STateManagement
- `WeatherCubit` → Manages getting Weather state.