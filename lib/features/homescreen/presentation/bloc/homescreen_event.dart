part of 'homescreen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.getData() = GetData;
  const factory HomeScreenEvent.showMessage() = ShowMessage;
  const factory HomeScreenEvent.getWeatherbars({
    required List<WeatherBarEntity> weatherbars,
    required int offset,
  }) = GetWeatherbars;
}
