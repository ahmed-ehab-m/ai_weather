import 'package:ai_weather/features/home/domain/entities/base_weather_entity.dart';
import 'package:ai_weather/features/home/domain/entities/forecast_weather_entity.dart';

class WeatherEntity extends BaseWeatherEntity {
  final List<ForecastEntity> forecast;
  final String location;
  WeatherEntity(
      {required this.location,
      required this.forecast,
      required super.rain,
      required super.uv,
      required super.condition,
      required super.temp,
      required super.humidity});
}
