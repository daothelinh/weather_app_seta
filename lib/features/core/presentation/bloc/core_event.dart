part of 'core_bloc.dart';

@freezed
class CoreEvent with _$CoreEvent {
  const factory CoreEvent.init() = Init;
  const factory CoreEvent.changeIndex(int i) = ChangeIndex;
  const factory CoreEvent.changeIndexHome(int i) = ChangeIndexHome;
  const factory CoreEvent.deleteArea(int i) = DeleteArea;
  const factory CoreEvent.addArea() = AddArea;
}
