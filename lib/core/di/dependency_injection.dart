import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/core/network/api_service.dart';
import 'package:ai_weather/features/auth/data/data_resources/auth_remote_datasource.dart';
import 'package:ai_weather/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_weather/features/auth/domain/repo_interface/auth_repositry.dart';
import 'package:ai_weather/features/auth/domain/usecases/login_usecase.dart';
import 'package:ai_weather/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ai_weather/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:ai_weather/features/home/data/data_resource/remote_data_resource.dart';
import 'package:ai_weather/features/home/data/repositries/remote_data_resource_impl.dart';
import 'package:ai_weather/features/home/domain/repo_interface/weather_repositry.dart';
import 'package:ai_weather/features/home/domain/use_cases/get_weather_usecase.dart';
import 'package:ai_weather/features/home/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

////for managing dependencies//////////
final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  await sl.isReady<SharedPreferences>();

  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(sl()));

  sl.registerLazySingleton(() => FirebaseAuth.instance);

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(sl(), sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecaseImpl(sl()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignupUsecaseImpl(sl()));
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl(), sl()));

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<WeatherApiService>(() => WeatherApiService(sl()));

  sl.registerLazySingleton<RemoteDataResource>(
    () => RemoteDataResource(
      sl(),
    ),
  );
  sl.registerLazySingleton<WeatherRepositry>(
    () => WeatherRepositryImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCaseImpl(sl()));

  sl.registerLazySingleton<WeatherCubit>(() => WeatherCubit(
        sl(),
      ));
}
