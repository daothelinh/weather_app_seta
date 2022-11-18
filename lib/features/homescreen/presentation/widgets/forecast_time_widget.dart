import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_date_time/forecast_date_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/presentation/bloc/homescreen_bloc.dart';
import 'package:base_bloc_3/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entity/forecast_time/forecast_time_entity.dart';

class ForecastTimeWidget extends StatelessWidget {
  const ForecastTimeWidget(
      {super.key, this.forecastTimeEntity, this.forecastDateTimeEntity});
  final ForecastTimeEntity? forecastTimeEntity;
  final ForecastDateTimeEntity? forecastDateTimeEntity;
  @override
  Widget build(BuildContext context) {
    final bloc = context.select((HomeScreenBloc bloc) => bloc);
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0.w, top: 18.h),
          child: Text(
            "${forecastTimeEntity?.headline?.forecastTimeText}",
            style: const TextStyle(
                color: Colors.white, fontFamily: FontFamily.lexend),
          ),
        ),
        SizedBox(height: 15.h),
        Container(
          height: 1.2.h,
          width: 320.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
        ),
        SizedBox(
          height: 150.h,
          child: CustomListViewSeparated<ForecastDateTimeEntity>(
            separatorBuilder: (c, i) => const Divider(),
            controller: bloc.pagingController,
            builder: (c, item, i) {
              return Column(children: <Widget>[
                WeatherCard(
                  data: item,
                ),
                SizedBox(
                  width: 80.w,
                )
              ]);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class WeatherCard extends StatelessWidget {
  final ForecastDateTimeEntity data;
  const WeatherCard({super.key, required this.data});
  convertFtoC(double f) {
    return ((f - 32) * 5 / 9).floor();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          // "data",
          "${data.dateTime?[11]}${data.dateTime?[12]}",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        SizedBox(
          height: 15.h,
        ),
        Icon(
          Icons.sunny,
          color: Colors.white,
          size: 30.sp,
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          // "data",
          "${convertFtoC(data.temperature?.temperatureDateTime ?? 0)}°",
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      ],
    );
  }
}
