class BaseWeatherEntity {
  final dynamic temp;
  final dynamic humidity;
  final String condition;
  final dynamic uv;
  final dynamic rain;

  BaseWeatherEntity({
    required this.temp,
    required this.humidity,
    required this.condition,
    required this.uv,
    required this.rain,
  });

  static List<int> feature(BaseWeatherEntity entity) {
    List<int> features = [];
    //////////Rainy////////////
    entity.rain > 0.5 ? features.add(1) : features.add(0);
    ///////////Sunny////////////
    entity.uv > 5 || entity.condition == 'Sunny'
        ? features.add(1)
        : features.add(0);
    /////////////hot/////////////
    entity.temp > 30 ? features.add(1) : features.add(0);
    /////////////mild/////////////
    entity.temp > 20 && entity.temp < 30 ? features.add(1) : features.add(0);
    ///////humditiy////////////////
    entity.humidity > 50 ? features.add(1) : features.add(0);
    return features;
  }
}
