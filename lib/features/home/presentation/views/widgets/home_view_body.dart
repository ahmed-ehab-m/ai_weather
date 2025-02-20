import 'package:ai_weather/core/di/dependency_injection.dart';
import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/core/helper/functions/custom_snack_bar.dart';
import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/core/location/get_location.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/core/utils/strings.dart';
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
  @override
  void initState() {
    super.initState();
    fetchWeatherData();
    getData();
  }

  Future<void> fetchWeatherData() async {
    String position = await GetLocation.getCurrentLocation();
    await sl<WeatherCubit>().getCurrentWeather(
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
          color = BlocProvider.of<WeatherCubit>(context)
              .getThemeColor(weather?.condition ?? '');
        }
        if (state is GetWeatherChanged) {
          color = BlocProvider.of<WeatherCubit>(context).getThemeColor(
              sl<WeatherCubit>().selectedDayIndex == 0
                  ? weather?.condition ?? ''
                  : weather
                      ?.forecast[BlocProvider.of<WeatherCubit>(context)
                          .selectedDayIndex]
                      .condition);
        }
      },
      builder: (context, state) {
        final cubit = sl<WeatherCubit>();
        return RefreshIndicator(
          color: Colors.white,
          backgroundColor: kPrimaryColor,
          onRefresh: () async {
            await fetchWeatherData();
            cubit.changeSelectedDay(0);
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
                          cubit.changeSelectedDay(index);
                        },
                        selectedIndex: sl<WeatherCubit>().selectedDayIndex,

                        /////////////////////////////////////
                      ),
                      Center(
                        child: TempertureItem(
                          temp: sl<WeatherCubit>().selectedDayIndex == 0
                              ? weather?.temp.truncate().toString() ?? '_'
                              : weather
                                      ?.forecast[
                                          sl<WeatherCubit>().selectedDayIndex]
                                      .averageTemp
                                      .truncate()
                                      .toString() ??
                                  '_',
                          type: sl<WeatherCubit>().selectedDayIndex == 0
                              ? weather?.condition ?? '_'
                              : weather
                                      ?.forecast[
                                          sl<WeatherCubit>().selectedDayIndex]
                                      .condition ??
                                  '_',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailsItem(
                            type: AppStrings.humidity,
                            value: sl<WeatherCubit>().selectedDayIndex == 0
                                ? weather?.humidity.truncate() ?? 0
                                : weather
                                        ?.forecast[
                                            sl<WeatherCubit>().selectedDayIndex]
                                        .averageHumidity
                                        .truncate() ??
                                    0,
                          ),
                          DetailsItem(
                            type: AppStrings.uv,
                            value: sl<WeatherCubit>().selectedDayIndex == 0
                                ? weather?.uv.truncate() ?? 0
                                : weather
                                        ?.forecast[
                                            sl<WeatherCubit>().selectedDayIndex]
                                        .uv
                                        .truncate() ??
                                    0,
                          ),
                          DetailsItem(
                              type: AppStrings.rain,
                              value: sl<WeatherCubit>().selectedDayIndex == 0
                                  ? weather?.rain.truncate() ?? 0
                                  : weather
                                          ?.forecast[sl<WeatherCubit>()
                                              .selectedDayIndex]
                                          .rainChance
                                          .truncate() ??
                                      0),
                        ],
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
