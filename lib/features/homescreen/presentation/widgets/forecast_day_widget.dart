import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_day/forecast_day_entity.dart';
import 'package:base_bloc_3/features/homescreen/presentation/bloc/homescreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ForecastDayWidget extends StatelessWidget {
  const ForecastDayWidget({super.key, this.forecastDayEntity});
  final ForecastDayEntity? forecastDayEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
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
                padding: const EdgeInsets.all(10),
                itemBuilder: (c, i) {
                  return ForeCastDayCard(
                    data: forecastDay,
                    index: i,
                  );
                },
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => const SizedBox(height: 2),
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

  const ForeCastDayCard({super.key, this.data, this.index});
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateFormat("yyyy-MM-ddThh:mm:ss")
        .parse("${data?.dailyForecastsDay?[index ?? 0].date}");
    var dateformat = DateFormat('EEEE').format(dateTime);
    return Column(
      children: <Widget>[
        Container(
          height: 1.2,
          width: 380,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(children: <Widget>[
          const SizedBox(width: 10),
          Text(
            dateformat.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.sunny,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            "${(data?.dailyForecastsDay?[index ?? 0].temperatureDay?.minimum?.value ?? 0) - 51}°",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(width: 10),
          Container(
            height: 6,
            width: 120,
            // color: Colors.yellow,
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                color: Colors.white54,
                // width: 350,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "${(data?.dailyForecastsDay?[index ?? 0].temperatureDay?.maximum?.value ?? 0) - 58}°",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(width: 10),
        ]),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
