import '../../../data/models/forecast_time/forecast_time.dart';

class ForecastTimeEntity {
  final HeadlineEntity? headline;
  final List<DailyForecastsEntity>? dailyForecasts;

  ForecastTimeEntity({this.headline, this.dailyForecasts});

  factory ForecastTimeEntity.fromModel(ForecastTime forecastTime) =>
      ForecastTimeEntity(
        headline: HeadlineEntity.fromModel(forecastTime.headline!),
        dailyForecasts: forecastTime.dailyForecasts
            ?.map((e) => DailyForecastsEntity.fromModel(e))
            .toList(),
      );
}

class HeadlineEntity {
  final String? forecastTimeText;

  HeadlineEntity({this.forecastTimeText});
  factory HeadlineEntity.fromModel(Headline headline) =>
      HeadlineEntity(forecastTimeText: headline.text);
}

class DailyForecastsEntity {
  final Temperature? temperature;

  DailyForecastsEntity({this.temperature});

  factory DailyForecastsEntity.fromModel(DailyForecasts dailyForecasts) =>
      DailyForecastsEntity(temperature: dailyForecasts.temperature);
}

class TemperatureEntity {
  final Minimum? minTemperature;
  final Maximum? maxTemperature;

  TemperatureEntity({this.minTemperature, this.maxTemperature});

  factory TemperatureEntity.fromModel(Temperature temperature) =>
      TemperatureEntity(
          minTemperature: temperature.minimum,
          maxTemperature: temperature.maximum);
}

class MinninumEntity {
  final num? minTemperature;

  MinninumEntity({this.minTemperature});
  factory MinninumEntity.fromModel(Minimum minimum) =>
      MinninumEntity(minTemperature: minimum.value);
}

class MaximumEntity {
  final num? maxTemperature;

  MaximumEntity({this.maxTemperature});
  factory MaximumEntity.fromModel(Maximum maximum) =>
      MaximumEntity(maxTemperature: maximum.value);
}
