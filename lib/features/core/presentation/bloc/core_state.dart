part of 'core_bloc.dart';

@CopyWith()
class CoreState extends BaseBlocState {
  const CoreState(
      {required super.status,
      super.message,
      this.index = 1,
      this.indexHome = 0,
      this.listLocationKey});

  final int index;
  final int indexHome;
  final List<String>? listLocationKey;

  factory CoreState.init() {
    return const CoreState(status: BaseStateStatus.init);
  }

  @override
  List get props => [status, index, message, indexHome, listLocationKey];
}
