part of 'start_bloc.dart';

@freezed
class StartEvent with _$StartEvent {
  const factory StartEvent.init(int index) = Init;
  const factory StartEvent.onSearch(String text) = OnSearch;
  const factory StartEvent.changeSearch() = ChangeSearch;
}
