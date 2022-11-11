import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/base/network/errors/extension.dart';
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
import '../../data/model/city_model.dart';
import '../../data/model/focast_time/forecast_time.dart';
import '../../data/model/location/location.dart';
import '../argument/area.dart';

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
        chooseCity: (dynamic city) => onChooseCity(emit, city),
        getListLocation: () => onGetListLocation(emit),
      );
    });
  }
  late List<String> _listLocationKey; // chứa id
  late List<dynamic> _listLocation; // chứa id
  final WeatherUseCase _useCase;
  late List<Area> _area;
  final PagingController<int, CityModel> pageController =
      PagingController(firstPageKey: 10);

  late TextEditingController controller = TextEditingController();

  onInit(Emitter<WeatherState> emit) async {
    _listLocationKey =
        List<String>.from(await localPref.get(AppLocalKey.listLocation) ?? []);
    print(_listLocationKey);
    List<Area> _area = [];

    for (var e in _listLocationKey) {
      List<Future> future = [];
      Area area = Area(key: e);
      future.addAll([
        _useCase.getForecast(locationKey: e).then((value) => value.fold(
            (l) => null, (r) => area = area.copyWith(forecastTime: r))),
        _useCase.getLocation(locationKey: e).then((value) => value.fold(
            (l) => null, (r) => area = area.copyWith(location: r.first)))
      ]);
      await Future.wait(future);
    }
    emit(state.copyWith(area: _area));
  }

  onGetListLocation(Emitter<WeatherState> emit) async {
    // _listLocation =
  }

  onGetFormSearch(Emitter<WeatherState> emit) async {
    // controller.text = 'a';
  }

  onGetSearchText(Emitter<WeatherState> emit, String text) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final res = await _useCase.getCity(q: text);
    emit(res.fold(
      (l) => state.copyWith(
          status: BaseStateStatus.failed, message: l.getErrorMessage),
      (r) => state.copyWith(status: BaseStateStatus.success, city: r),
    ));
  }

  getListArea() {
    // emit(state.copyWith());
  }

  onChooseCity(Emitter<WeatherState> emit, CityModel city) async {
    controller.text = city.englishName ?? '';
    if (!_listLocationKey.contains(city.key)) {
      _listLocationKey.add(city.key ?? '');
      await localPref.save(AppLocalKey.listLocation, _listLocationKey);
    }
    // final locationRes = await _useCase.getLocation(locationKey: city.key!);
    // emit(locationRes.fold(
    //   (l) => state.copyWith(status: BaseStateStatus.failed),
    //   (r) => state.copyWith(location: r),
    // ));
    // final forecastRes = await _useCase.getForecast(locationKey: city.key!);
    // emit(forecastRes.fold(
    //   (l) => state.copyWith(status: BaseStateStatus.failed),
    //   (r) => state.copyWith(forecast: r),
    // ));
  }
}
