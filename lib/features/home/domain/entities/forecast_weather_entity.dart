import 'package:ai_weather/features/home/domain/entities/base_weather_entity.dart';

class ForecastEntity extends BaseWeatherEntity {
  ForecastEntity({
    required super.temp,
    required super.humidity,
    required super.rain,
    required super.condition,
    required super.uv,
  });
}
