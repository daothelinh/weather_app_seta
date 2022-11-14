import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/features/homescreen/data/models/forecast_day/forecast_day.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_date_time/forecast_date_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_time/forecast_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/domain/use_case/use_case_forecast_date_time/use_case_forecast_date_time.dart';
import 'package:base_bloc_3/features/homescreen/domain/use_case/use_case_forecast_day/usecase_forecast_day.dart';
import 'package:base_bloc_3/features/homescreen/domain/use_case/use_case_forecast_time/use_case_forecast_time.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/weatherbar/weather_bar.dart';
import '../../domain/entity/weatherbar/weather_bar_entity.dart';
import '../../domain/use_case/use_case_weather_bar/use_case_weather_bar.dart';

part 'homescreen_bloc.freezed.dart';
part 'homescreen_bloc.g.dart';
part 'homescreen_event.dart';
part 'homescreen_state.dart';

@injectable
class HomeScreenBloc extends BaseBloc<HomeScreenEvent, HomeScreenState>
    with BaseCommonMethodMixin {
  HomeScreenBloc(
    this._coreUseCaseWeatherBar,
    this._forecastTimeUsecase,
    this._forecastDateTimeUsecase,
    this._forecastDayUsecase,
  ) : super(HomeScreenState.init()) {
    on<HomeScreenEvent>(
      (HomeScreenEvent event, Emitter<HomeScreenState> emit) async {
        await event.when(
            getData: () => onGetData(emit),
            getDataForecastTime: () => onGetDataForecastTime(emit),
            getDataForecastDay: () => onGetDataForecastDay(emit),
            // () =>
            //   (List<DailyForecastDayEntity> dailyForecastDay) =>
            //       onGetDataForecastDay(emit, dailyForecastDay)),
            getDataForecastDateTime:
                (List<ForecastDateTimeEntity> forecastDateTimes) =>
                    onGetDataForecastDateTime(emit, forecastDateTimes),
            showMessage: () => onShowMessage(emit),
            getWeatherbars: (List<WeatherBarEntity> weatherbars, int offset) =>
                onGetWeatherbars(emit, weatherbars, offset));
      },
    );
  }
  final WeatherBarUseCase _coreUseCaseWeatherBar;
  Future onGetData(Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final res = await _coreUseCaseWeatherBar.getData();
    res.fold(
      (l) => emit(
          state.copyWith(status: BaseStateStatus.failed, message: 'Error')),
      (r) =>
          emit(state.copyWith(status: BaseStateStatus.success, weatherbars: r)),
    );

    // ignore: avoid_print
    print("Done on Get Data weather bar in HomeScreen Bloc");
  }

  final ForecastTimeUsecase _forecastTimeUsecase;
  Future onGetDataForecastTime(Emitter<HomeScreenState> emit) async {
    final res = await _forecastTimeUsecase.getDataForecastTime();
    res.fold(
      (l) => emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: 'Error get Data Forecast Time')),
      (r) => emit(
          state.copyWith(status: BaseStateStatus.success, forecastTime: r)),
    );
    // ignore: avoid_print
    print("Done get data of forecast time widget");
  }

  // fore cast daily temperature

  final PagingController<int, ForecastDateTimeEntity> pagingController =
      PagingController(firstPageKey: 0);

  final ForecastDateTimeUsecase _forecastDateTimeUsecase;
  Future onGetDataForecastDateTime(Emitter<HomeScreenState> emit,
      List<ForecastDateTimeEntity> forecaseDateTimes) async {
    // await Future.delayed(const Duration(seconds: 2));
    // pagingController.itemList = [];
    // emit(
    // state.copyWith(status: BaseStateStatus.success, forecastDateTimes: []));
    final res = await _forecastDateTimeUsecase.getDataForecastDateTime();
    res.fold(
      (l) => emit(
          state.copyWith(status: BaseStateStatus.failed, message: 'Error')),
      (r) {
        pagingController.itemList = r;
        emit(state.copyWith(
            status: BaseStateStatus.success, forecastDateTimes: r));
      },
    );
  }

  // final PagingController<int, DailyForecastDayEntity> pagingControllerDay =
  //     PagingController(firstPageKey: 0);
  final ForecastDayUsecase _forecastDayUsecase;
  Future onGetDataForecastDay(
    Emitter<HomeScreenState> emit,
    // List<DailyForecastDayEntity>? dailyForecastDay
  ) async {
    final res = await _forecastDayUsecase.getDataForecastDay();
    res.fold((l) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        message: 'Error of get data forecast day',
      ));
    }, (r) {
      // pagingControllerDay.itemList = r as List<DailyForecastDayEntity>?;
      emit(state.copyWith(
        status: BaseStateStatus.success,
        forecastDay: r,
      ));
    });
    print('Done get data in forecast day widget');
  }

  onGetWeatherbars(Emitter<HomeScreenState> emit,
      List<WeatherBarEntity> weatherbars, int offset) {}

  onShowMessage(Emitter<HomeScreenState> emit) {}
}
