import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:base_bloc_3/features/homescreen/presentation/bloc/homescreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ForecastDayWidget extends StatelessWidget {
  const ForecastDayWidget({super.key, this.forecastDayEntity});
  final ForecastDayEntity? forecastDayEntity;
  convertFtoC(double f) {
    return ((f - 32) * 5 / 9).floor();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Row(
            children: const [
              Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              Text(
                "  5 - DAY  FORECAST",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              final forecastDay = context
                  .select((HomeScreenBloc bloc) => bloc.state.forecastDay);
              return ListView.separated(
                padding: EdgeInsets.all(10.w),
                itemBuilder: (c, i) {
                  return ForeCastDayCard(
                    data: forecastDay,
                    index: i,
                  );
                },
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => SizedBox(height: 2.h),
                itemCount: 5,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ForeCastDayCard extends StatelessWidget {
  final ForecastDayEntity? data;
  final int? index;
  convertFtoC(double f) {
    return ((f - 32) * 5 / 9).floor();
  }

  const ForeCastDayCard({super.key, this.data, this.index});
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateFormat("yyyy-MM-ddThh:mm:ss")
        .parse("${data?.dailyForecastsDay?[index ?? 0].date}");
    var dateformat = DateFormat('EEEE').format(dateTime);
    return Column(
      children: <Widget>[
        Container(
          height: 1.2.h,
          width: 380.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Row(children: <Widget>[
          SizedBox(width: 10.w),
          Text(
            dateformat.toString(),
            style: TextStyle(color: Colors.white, fontSize: 19.sp),
          ),
          SizedBox(width: 10.w),
          const Icon(
            Icons.sunny,
            color: Colors.white,
          ),
          SizedBox(width: 10.w),
          Text(
            "${convertFtoC(data?.dailyForecastsDay?[index ?? 0].temperatureDay?.minimum?.value ?? 0)}°",
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
          SizedBox(width: 10.w),
          Container(
            height: 4.h,
            width: 120.h,
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                color: Colors.white54,
              ),
              borderRadius: BorderRadius.circular(8.0.r),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            "${convertFtoC(data?.dailyForecastsDay?[index ?? 0].temperatureDay?.maximum?.value ?? 0)}°",
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
        ]),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
