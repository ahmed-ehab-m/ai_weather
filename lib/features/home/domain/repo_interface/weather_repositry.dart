import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepositry {
  Future<Either<Failure, WeatherEntity>> getWeather({required String location});
  Future<Either<Failure, Map<String, dynamic>>> getPredictions(
      {required List<int> features});
}
