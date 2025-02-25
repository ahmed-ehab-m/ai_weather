import 'package:ai_weather/features/home/data/models/forecast_weather_model.dart';
import 'package:ai_weather/features/home/domain/entities/base_weather_entity.dart';
import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';

class WeatherModel extends BaseWeatherEntity {
  final List<ForecastWeatherModel> forecast;
  final String location;
  WeatherModel({
    required this.forecast,
    required this.location,
    required super.uv,
    required super.condition,
    required super.temp,
    required super.humidity,
    required super.rain,
  });

  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      WeatherModel(
          temp: json['current']['temp_c'].toDouble(),
          humidity: json['current']['humidity'],
          condition: json['current']['condition']['text'],
          uv: json['current']['uv'],
          rain: json['current']['precip_mm'],
          location: json['location']['region'],
          forecast: (json['forecast']['forecastday'] as List)
              .map((day) => ForecastWeatherModel.fromJson(day))
              .toList());

  WeatherEntity toEntity() {
    return WeatherEntity(
        forecast: forecast.map((e) => e.toEntity()).toList(),
        rain: rain,
        temp: temp,
        humidity: humidity,
        condition: condition,
        uv: uv,
        location: location);
  }
}
