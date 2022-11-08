import 'package:base_bloc_3/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/forecast_time/forecast_time_entity.dart';

class ForecastTimeWidget extends StatelessWidget {
  const ForecastTimeWidget({super.key, this.forecastTimeEntity});
  final ForecastTimeEntity? forecastTimeEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 18),
          child: Text(
            // " Cloudy conditions from 1AM-9AM, with showers expected at 9AM. ",
            "${forecastTimeEntity?.headline?.forecastTimeText}",
            style: const TextStyle(
                color: Colors.white, fontFamily: FontFamily.lexend),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 1,
          width: 320,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(
                width: 30,
              ),
              weatherCard(),
              const SizedBox(
                width: 30,
              ),
              weatherCard(),
              const SizedBox(
                width: 30,
              ),
              weatherCard(),
              const SizedBox(
                width: 30,
              ),
              weatherCard(),
              const SizedBox(
                width: 30,
              ),
              weatherCard(),
              const SizedBox(
                width: 30,
              ),
              weatherCard(),
              const SizedBox(
                width: 30,
              ),
              weatherCard(),
            ],
          ),
        ),
      ],
      // ),
    );
  }
}

Widget weatherCard() => Column(
      children: const [
        Text(
          "data",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        SizedBox(
          height: 15,
        ),
        Icon(
          Icons.sunny,
          color: Colors.white,
          size: 32,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "data",
          style: TextStyle(color: Colors.white, fontSize: 17),
        )
      ],
    );
