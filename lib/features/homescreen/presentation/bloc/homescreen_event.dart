part of 'homescreen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.init(String locationKey) = Init;
  const factory HomeScreenEvent.getData(String locationKey) = GetData;
  const factory HomeScreenEvent.getDataForecastTime(String locationKey) =
      GetDataForecastTime;
  const factory HomeScreenEvent.getDataForecastDateTime({
    required List<ForecastDateTimeEntity> forecastDateTimes,
    required String locationKey,
  }) = GetDataForecastDateTime;
  const factory HomeScreenEvent.getDataForecastDay(String locationKey) =
      GetDataForecastDay;
  const factory HomeScreenEvent.showMessage() = ShowMessage;
  const factory HomeScreenEvent.getWeatherbars({
    required List<WeatherBarEntity> weatherbars,
    required int offset,
  }) = GetWeatherbars;
}
