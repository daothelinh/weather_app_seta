import 'package:base_bloc_3/features/homescreen/data/models/forecast_day/forecast_day.dart';

class ForecastDayEntity {
  final List<DailyForecastDayEntity>? dailyForecastsDay;

  ForecastDayEntity({this.dailyForecastsDay});
  factory ForecastDayEntity.fromModel(ForecastDay forecastDay) {
    return ForecastDayEntity(
      dailyForecastsDay: forecastDay.dailyForecasts
          ?.map((e) => DailyForecastDayEntity.fromModel(e))
          .toList(),
    );
  }
}

class DailyForecastDayEntity {
  final Temperature? temperatureDay;
  final String? date;

  DailyForecastDayEntity({
    this.temperatureDay,
    this.date,
  });
  factory DailyForecastDayEntity.fromModel(DailyForecasts dailyForecasts) {
    return DailyForecastDayEntity(
        temperatureDay: dailyForecasts.temperature, date: dailyForecasts.date);
  }
}

class TemperatureDayEntity {
  final Minimum? minimumDay;
  final Maximum? maximumDay;

  TemperatureDayEntity({this.minimumDay, this.maximumDay});
  factory TemperatureDayEntity.fromModel(Temperature temperature) {
    return TemperatureDayEntity(
      minimumDay: temperature.minimum,
      maximumDay: temperature.maximum,
    );
  }
}

class MinimumDayEntity {
  final double? minTemperatureDay;

  MinimumDayEntity({this.minTemperatureDay});
  factory MinimumDayEntity.fromModel(Minimum minimum) {
    return MinimumDayEntity(minTemperatureDay: minimum.value);
  }
}

class MaximumDayEntity {
  final double? maxTemperatureDay;

  MaximumDayEntity({this.maxTemperatureDay});

  factory MaximumDayEntity.fromModel(Maximum maximum) {
    return MaximumDayEntity(maxTemperatureDay: maximum.value);
  }
}
