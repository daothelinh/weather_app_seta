import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/bloc/index.dart';
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
}

onGetWeatherbars(Emitter<HomeScreenState> emit,
    List<WeatherBarEntity> weatherbars, int offset) {}

onShowMessage(Emitter<HomeScreenState> emit) {}

onGetData(Emitter<HomeScreenState> emit) {}
