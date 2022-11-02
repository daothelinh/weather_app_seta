import 'package:base_bloc_3/features/weather/data/model/area/area_model.dart';

class MinimumEntity {
  final double? value;
  final String? unit;
  MinimumEntity({this.value, this.unit});

  factory MinimumEntity.fromModel(Minimum min) => MinimumEntity(
        value: min.value,
        unit: min.unit,
      );
}

class MaximumEntity {
  final double? value;
  final String? unit;
  MaximumEntity({this.value, this.unit});
  factory MaximumEntity.fromModel(Maximum min) => MaximumEntity(
        value: min.value,
        unit: min.unit,
      );
}

class TemperatureEntity {
  final MaximumEntity? max;
  final MinimumEntity? min;

  TemperatureEntity({this.max, this.min});
  factory TemperatureEntity.fromModel(Temperature temp) => TemperatureEntity(
      max: MaximumEntity.fromModel(temp.maximum!),
      min: MinimumEntity.fromModel(temp.minimum!));
}

class HeadlineEntity {
  final String? text;
  final String? endDate;
  HeadlineEntity({this.text, this.endDate});

  factory HeadlineEntity.fromModel(Headline headline) => HeadlineEntity(
        text: headline.text,
      );
}

class DailyForecastsEntity {
  final String? date;
  final TemperatureEntity? temperature;

  DailyForecastsEntity({this.date, this.temperature});
  factory DailyForecastsEntity.fromModel(DailyForecasts dailyForecasts) =>
      DailyForecastsEntity(
        date: dailyForecasts.date,
        temperature: TemperatureEntity.fromModel(dailyForecasts.temperature!),
      );
}

class AreaEntity {
  final HeadlineEntity? headline;
  final List<DailyForecastsEntity>? dailyForecast;

  AreaEntity({this.headline, this.dailyForecast});

  factory AreaEntity.fromModel(AreaModel area) => AreaEntity(
      headline: HeadlineEntity.fromModel(area.headline!),
      dailyForecast: area.dailyForecasts
          ?.map((e) => DailyForecastsEntity.fromModel(e))
          .toList());
}
