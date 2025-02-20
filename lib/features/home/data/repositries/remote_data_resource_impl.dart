import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/home/data/data_resource/remote_data_resource.dart';
import 'package:ai_weather/features/home/data/models/current_weather_model.dart';
import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';
import 'package:ai_weather/features/home/domain/repo_interface/weather_repositry.dart';
import 'package:dartz/dartz.dart';

class WeatherRepositryImpl implements WeatherRepositry {
  final RemoteDataResource remoteDataResource;
  WeatherRepositryImpl(this.remoteDataResource);
  @override
  Future<Either<Failure, WeatherEntity>> getWeather({
    required String location,
  }) async {
    try {
      final WeatherModel weatherModel =
          await remoteDataResource.getWeather(location: location);
      return Right(weatherModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
