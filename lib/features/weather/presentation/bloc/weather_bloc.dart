import 'dart:async';

import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/debounce/debounce.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/features/example/domain/use_case/use_case.dart';
import 'package:base_bloc_3/features/weather/domain/use_case/weather_use_case.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/network/errors/error.dart';
import '../../data/model/area_model.dart';

part 'weather_bloc.freezed.dart';
part 'weather_bloc.g.dart';
part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends BaseBloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._useCase) : super(WeatherState.init()) {
    on<WeatherEvent>((WeatherEvent event, Emitter<WeatherState> emit) async {
      await event.when(
        init: () => onInit(emit),
        getFormSearch: () => onGetFormSearch(emit),
        getSearchText: (String text) => onGetSearchText(emit, text),
        chooseCity: (String idCity) => onChooseCity(emit, idCity),
      );
    });
  }
  late List<String> listArea;
  final WeatherUseCase _useCase;
  final PagingController<int, AreaModel> pageController =
      PagingController(firstPageKey: 10);

  late TextEditingController controller = TextEditingController();
  final _debounce = Debouncer(milliseconds: 500);
  getCityFromLocal() async {
    listArea = await localPref.get(AppLocalKey.search);
  }

  onInit(Emitter<WeatherState> emit) async {
    controller.text = 'a';
    await getCityFromLocal();
  }

  getListCity() {
    // return localPref.get(key)
  }

  onGetFormSearch(Emitter<WeatherState> emit) async {
    controller.text = 'a';
  }

  onGetSearchText(Emitter<WeatherState> emit, String text) async {
    if (text.trim().isNotEmpty) {
      // var result;
      emit(state.copyWith(status: BaseStateStatus.loading));
      final result = await _debounce.run(() => _useCase.getArea(q: text));
      if (result != null) {
        emit(result.fold(
          (l) =>
              state.copyWith(status: BaseStateStatus.failed, message: 'error'),
          (r) => state.copyWith(status: BaseStateStatus.success, area: r),
        ));
      }
    } else {
      emit(state.copyWith(status: BaseStateStatus.init));
    }
  }

  onChooseCity(Emitter<WeatherState> emit, dynamic idCity) async {
    if (listArea.contains(idCity)) {
      listArea.add(idCity);
      await localPref.save(AppLocalKey.search, listArea);
    }
  }
}
