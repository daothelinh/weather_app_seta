import 'dart:convert';

import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/local_data/app_local_key.dart';
import 'package:base_bloc_3/common/local_data/index.dart';
import 'package:base_bloc_3/features/weather/domain/use_case/weather_use_case.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../base/base_widget.dart';
import '../../../../di/di_setup.dart';
import '../../domain/entity/index.dart';

part 'weather_bloc.freezed.dart';
part 'weather_bloc.g.dart';
part 'weather_state.dart';
part 'weather_event.dart';

@injectable
class WeatherBloc extends BaseBloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._useCase) : super(WeatherState.init()) {
    on<WeatherEvent>((WeatherEvent event, Emitter<WeatherState> emit) async {
      await event.when(
        init: () => onInit(emit),
        searching: (String text) => onSearching(emit, text),
        chooseCity: (String text, CityEntity city) =>
            chooseCity(emit, text, city),
        showOverlay: () => onShowOverlay(emit),
        getArea: (String key) => onGetArea(emit, key),
        hideOverlay: () => onHideOverlay(emit),
      );
    });
  }
  late bool isSearching = false;
  late bool isShowOverlay = false;
  late TextEditingController controller = TextEditingController();

  final WeatherUseCase _useCase;
  Future onInit(Emitter<WeatherState> emit) async {
    emit(state.copyWith(isSearching: false));
    // eventBus.fire(WeatherEvent);
    // print(eventBus.get())
    // eventBus.on<_$HideOverlay>().listen((event) {
    //   print(event.runtimeType);
    // });
  }

  Future onHideOverlay(Emitter<WeatherState> emit) async {
    emit(state.copyWith(isSearching: false));

    print('hide overlay');
  }

  Future onShowOverlay(Emitter<WeatherState> emit) async {
    emit(state.copyWith(
        isSearching: true,
        status: BaseStateStatus.init,
        listCity: await getListPrefCity()));
  }

  Future onSearching(Emitter<WeatherState> emit, String text) async {
    if (text.trim().isNotEmpty) {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final res = await _useCase.getCity(offset: 10, q: text.toString());

      emit(res.fold(
        (l) => state.copyWith(status: BaseStateStatus.failed),
        (r) => state.copyWith(status: BaseStateStatus.success, listCity: r),
      ));
    } else {
      emit(state.copyWith(
          status: BaseStateStatus.init, listCity: await getListPrefCity()));
    }
  }

  void checkSelection(String text) async {
    controller.text = text;
    controller.selection = TextSelection(
        baseOffset: controller.text.length,
        extentOffset: controller.text.length);
  }

  Future onGetArea(Emitter<WeatherState> emit, String key) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final res = await _useCase.getArea(locationKey: key);

    emit(res.fold(
      (l) => state.copyWith(status: BaseStateStatus.init),
      (r) => state.copyWith(status: BaseStateStatus.success, area: r),
    ));
  }

  Future chooseCity(
    Emitter<WeatherState> emit,
    String text,
    CityEntity city,
  ) async {
    checkSelection(text);
    if (listPrefSearchValue.contains(jsonEncode(city))) {
    } else {
      saveListSearch(city);
    }
    //emit list city
    emit(state.copyWith(status: BaseStateStatus.success));
    await onGetArea(emit, city.id ?? '0');
  }
}
