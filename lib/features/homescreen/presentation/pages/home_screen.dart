import 'dart:ui';

import 'package:base_bloc_3/features/homescreen/presentation/widgets/forecast_dayWG.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/forecast_timeWG.dart';
import 'package:base_bloc_3/features/homescreen/data/models/location.dart';
import 'package:base_bloc_3/features/homescreen/domain/repositories/forecastTime/location_repository.dart';
import 'package:base_bloc_3/features/homescreen/presentation/widgets/temperatureWG.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocationRepository client = LocationRepository();
  Location? data;

  Future<Location?> getData() async {
    data = await client.getCurrentLocation("hanoi");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/background.jpg"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: FutureBuilder<Location?>(
            future: getData(),
            builder: ((context, snapshot) {
              return Center(
                  // Padding(
                  //   padding: const EdgeInsets.all(78.0),
                  child: Column(
                children: <Widget>[
                  // Location(location: ,),
                  Padding(
                    padding: EdgeInsets.only(top: 78),
                    child: Text(
                      "${data?.location}",
                      style: TextStyle(fontSize: 37, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 10),
                    child: Text(
                      "${data?.temperature}°",
                      // "21°",
                      style: TextStyle(fontSize: 90, color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 0.0, left: 13),
                    child: Text(
                      "Partly Cloudy",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "H:29°  L:15°",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: 370,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                        // width: 350,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const ForeCastTimeWG(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 480,
                    width: 370,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                        // width: 350,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const ForeCastDayWG(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    width: 370,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const TemperatureWG(),
                  ),
                  Row(
                    children: <Widget>[Column()],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ));
            }),
          ),
        ),
      ),
    );
  }
}
