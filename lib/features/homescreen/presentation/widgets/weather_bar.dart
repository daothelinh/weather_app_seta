import 'package:base_bloc_3/features/homescreen/domain/entity/weatherbar/weatherBarEntity.dart';
import 'package:base_bloc_3/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class WeatherBarWG extends StatelessWidget {
  const WeatherBarWG({super.key, this.temperature});
  final WeatherBarEntity? temperature;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 78),
          child: Text(
            // "${data?.location}",
            "Hanoi",
            style: TextStyle(fontSize: 37, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 10),
          child: Text(
            "${temperature?.temperature?.metric?.value}°",
            // "21°",
            style: const TextStyle(fontSize: 90, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 13),
          child: Text(
            // "Partly Cloudy",
            "${temperature?.weatherText}",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "H:29°  L:15°",
            style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontFamily: FontFamily.lexend),
          ),
        ),
      ],
    );
  }
}
