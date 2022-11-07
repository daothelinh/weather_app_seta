import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/weatherbar/weatherBar.dart';
import '../../domain/entity/weatherbar/weatherBarEntity.dart';
import '../../domain/use_case/use_caseHS.dart';

part 'homescreen_bloc.freezed.dart';
part 'homescreen_bloc.g.dart';
part 'homescreen_event.dart';
part 'homescreen_state.dart';

@injectable
class HomeScreenBloc extends BaseBloc<HomeScreenEvent, HomeScreenState>
    with BaseCommonMethodMixin {
  HomeScreenBloc(
      // HomescreenUseCase homescreenUseCase
      this._coreUseCaseHS)
      : super(HomeScreenState.init()) {
    on<HomeScreenEvent>(
      (HomeScreenEvent event, Emitter<HomeScreenState> emit) async {
        await event.when(
            getData: () => onGetData(emit),
            showMessage: () => onShowMessage(emit),
            getWeatherbars: (List<WeatherBarEntity> weatherbars, int offset) =>
                onGetWeatherbars(emit, weatherbars, offset));
      },
    );
  }
  final HomescreenUseCase _coreUseCaseHS;
  Future onGetData(Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final res = await _coreUseCaseHS.getData();
    res.fold(
      (l) => emit(
          state.copyWith(status: BaseStateStatus.failed, message: 'Error')),
      (r) =>
          emit(state.copyWith(status: BaseStateStatus.success, weatherbars: r)),
    );

    print("Done on Get Data in HomeScreen Bloc");
  }

  onGetWeatherbars(Emitter<HomeScreenState> emit,
      List<WeatherBarEntity> weatherbars, int offset) {}

  onShowMessage(Emitter<HomeScreenState> emit) {}
}
