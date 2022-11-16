import 'dart:convert';

import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/base/network/errors/extension.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/features/weather/domain/use_case/weather_use_case.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/city_model.dart';
import '../../domain/entity/area/area.dart';

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
        deleteArea: (int index) => onDeleteArea(emit, index),
        getSearchText: (String text) => onGetSearchText(emit, text),
        chooseCity: (dynamic city) => onChooseCity(emit, city),
        deleteCitySearch: (int index) => onDeleteCitySearch(emit, index),
      );
    });
  }
  final WeatherUseCase _useCase;
  late List<String> _listLocationKey; // chứa id
  late List<String> _listCityModelEncode;
  late TextEditingController controller = TextEditingController();

  onInit(Emitter<WeatherState> emit) async {
    _listLocationKey = List<String>.from(
        await localPref.get(AppLocalKey.listLocationKey) ?? []);
    // localPref.remove(AppLocalKey.listLocationKey);
    // localPref.remove(AppLocalKey.listSearchCity);
    // _listLocationKey = [];
    print(_listLocationKey);
    _listCityModelEncode = List<String>.from(
        await localPref.get(AppLocalKey.listSearchCity) ?? []);
    print(_listCityModelEncode);
    // print(_listCityModel);
    emit(state.copyWith(area: await onGetListArea()));
  }

  onGetListArea() async {
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
      _area.add(area);
    }
    return _area;
  }

  getCityFromLocal() async {
    List<CityModel> _listCityModel = List<CityModel>.from(
        _listCityModelEncode.map((e) => CityModel.fromJson(jsonDecode(e))));
    return _listCityModel;
  }

  onDeleteArea(Emitter<WeatherState> emit, int index) async {
    _listLocationKey.removeAt(index);
    await localPref.save(AppLocalKey.listLocationKey, _listLocationKey);
    emit(state.copyWith(area: await onGetListArea()));
  }

  saveCityToLocal(CityModel city) async {
    if (!_listCityModelEncode.contains(jsonEncode(city))) {
      _listCityModelEncode.add(jsonEncode(city));
      await localPref.save(AppLocalKey.listSearchCity, _listCityModelEncode);
    }
  }

  onGetSearchText(Emitter<WeatherState> emit, String text) async {
    if (text.trim().isNotEmpty) {
      emit(state.copyWith(status: BaseStateStatus.loading));

      final res = await _useCase.getCity(q: text);
      emit(res.fold(
        (l) => state.copyWith(
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ),
        (r) => state.copyWith(
          status: BaseStateStatus.success,
          city: r,
        ),
      ));
    } else {
      emit(
        state.copyWith(
          status: BaseStateStatus.idle,
          city: await getCityFromLocal(),
        ),
      );
    }
  }

  onChooseCity(Emitter<WeatherState> emit, CityModel city) async {
    controller.text = city.englishName ?? '';
    if (!_listLocationKey.contains(city.key)) {
      _listLocationKey.add(city.key ?? '');
      await localPref.save(AppLocalKey.listLocationKey, _listLocationKey);
      saveCityToLocal(city);
    }
    emit(state.copyWith(area: await onGetListArea()));
  }

  onClearTextField(Emitter<WeatherState> emit) async {
    emit(state.copyWith(area: await onGetListArea()));
  }

  onDeleteCitySearch(Emitter<WeatherState> emit, int index) async {
    if (index == -1) {
      await localPref.remove(AppLocalKey.listSearchCity);
    } else {
      //xoá 1 phần tử
      _listCityModelEncode.removeAt(index);
      await localPref.save(AppLocalKey.listSearchCity, _listCityModelEncode);
    }
    emit(state.copyWith(city: await getCityFromLocal()));
  }
}
