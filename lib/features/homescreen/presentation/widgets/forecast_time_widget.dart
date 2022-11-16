import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/features/homescreen/domain/entity/forecast_date_time/forecast_date_time_entity.dart';
import 'package:base_bloc_3/features/homescreen/presentation/bloc/homescreen_bloc.dart';
import 'package:base_bloc_3/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          padding: const EdgeInsets.only(left: 20.0, top: 18),
          child: Text(
            "${forecastTimeEntity?.headline?.forecastTimeText}",
            style: const TextStyle(
                color: Colors.white, fontFamily: FontFamily.lexend),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 1.2,
          width: 320,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        SizedBox(
          height: 150,
          child: CustomListViewSeparated<ForecastDateTimeEntity>(
            separatorBuilder: (c, i) => const Divider(),
            controller: bloc.pagingController,
            builder: (c, item, i) {
              return Column(children: <Widget>[
                WeatherCard(
                  data: item,
                ),
                const SizedBox(
                  width: 80,
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          // "data",
          "${data.dateTime?[11]}${data.dateTime?[12]}",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 15,
        ),
        const Icon(
          Icons.sunny,
          color: Colors.white,
          size: 32,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          // "data",
          "${(data.temperature?.temperatureDateTime ?? 0) - 55}°",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}
