import 'package:ai_weather/core/di/dependency_injection.dart';
import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/core/helper/functions/custom_snack_bar.dart';
import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/core/location/get_location.dart';
import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/core/utils/strings.dart';
import 'package:ai_weather/features/home/domain/entities/base_weather_entity.dart';
import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';
import 'package:ai_weather/features/home/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/forcast_days_list.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/details_item.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/temperture_item.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/welcome_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String userName = "";
  WeatherEntity? weather;
  Color color = Colors.blue;
  Map<String, dynamic>? result;
  List<int> features = [];
  String? predictionText;
  final weatherCubit = sl<WeatherCubit>();

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
    getData();
  }

  Future<void> fetchWeatherData() async {
    String position = await GetLocation.getCurrentLocation();
    await weatherCubit.getCurrentWeather(
      position,
    );
  }

  Future<void> getData() async {
    final userData = await sl<CacheHelper>().getUserData();
    setState(() {
      userName = userData!.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSizeHelper = ScreenSizeHelper(context);
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is GetWeatherLoading) {}
        if (state is GetWeatherFailure) {
          showSnackBar(context, message: state.message, color: Colors.red);
        }
        if (state is GetWeatherSuccess) {
          weather = state.weatherEntity;

          features = BaseWeatherEntity.feature(weather!);
          weatherCubit.getPrediction(features);
          color = weatherCubit.getThemeColor(weather?.condition ?? '');
        }
        if (state is GetWeatherChanged) {
          color = weatherCubit.getThemeColor(weatherCubit.selectedDayIndex == 0
              ? weather?.condition ?? ''
              : weather?.forecast[weatherCubit.selectedDayIndex].condition);
          features = BaseWeatherEntity.feature(
              weatherCubit.selectedDayIndex == 0
                  ? weather!
                  : weather!.forecast[weatherCubit.selectedDayIndex]);
          sl<WeatherCubit>().getPrediction(features);
        }
        if (state is GetPerdictionLoading) {}
        if (state is GetPerdictionFailure) {
          showSnackBar(context, message: state.message, color: Colors.red);
        }
        if (state is GetPerdictionSuccess) {
          result = state.result;
          predictionText = result!['prediction'][0] == 0
              ? AppStrings.badWeather
              : AppStrings.goodWeather;
        }
      },
      builder: (context, state) {
        final isToday = weatherCubit.selectedDayIndex == 0;
        final selectedWeather = isToday
            ? weather
            : weather?.forecast[weatherCubit.selectedDayIndex];
        return RefreshIndicator(
          color: Colors.white,
          backgroundColor: kPrimaryColor,
          onRefresh: () async {
            await fetchWeatherData();
            weatherCubit.changeSelectedDay(0);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withAlpha(100)],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSizeHelper.horizontalPadding,
                vertical: screenSizeHelper.homeVerticalPadding,
              ),
              child: ListView(
                children: [
                  Column(
                    spacing: screenSizeHelper.screenHeight * 0.07,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WelcomeMessage(
                        location: weather?.location ?? AppStrings.updating,
                        userName: userName,
                      ),
                      ForcastDaysList(
                        //////////////////////////////////////
                        onTap: (index) async {
                          weatherCubit.changeSelectedDay(index);
                        },
                        selectedIndex: weatherCubit.selectedDayIndex,

                        /////////////////////////////////////
                      ),
                      Center(
                        child: TempertureItem(
                          temp: selectedWeather?.temp.truncate().toString() ??
                              '_',
                          type: selectedWeather?.condition ?? '',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailsItem(
                            type: AppStrings.humidity,
                            value: selectedWeather?.humidity ?? 0,
                          ),
                          DetailsItem(
                            type: AppStrings.uv,
                            value: selectedWeather?.uv.truncate() ?? 0,
                          ),
                          DetailsItem(
                            type: AppStrings.rain,
                            value: selectedWeather?.rain ?? 0,
                          ),
                        ],
                      ),
                      Center(
                        child: Text(predictionText ?? '',
                            style: AppTextStyles.textStyle18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
