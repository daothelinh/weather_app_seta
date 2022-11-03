import 'dart:ui';

import 'package:base_bloc_3/features/homescreen/data/models/location.dart';
import 'package:base_bloc_3/features/homescreen/domain/repositories/forecastTime/location_repository.dart';
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
                    child: Column(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 18),
                          child: Text(
                            " Cloudy conditions from 1AM-9AM, with showers expected at 9AM. ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
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
                    ),
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
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    " 10-DAY  FORECAST",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        foreCastCard(),
                        foreCastCard(),
                        foreCastCard(),
                        foreCastCard(),
                        foreCastCard(),
                        foreCastCard(),
                        foreCastCard(),
                      ],
                    ),
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
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Column(
                            children: [
                              Row(
                                children: const <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.thermostat,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Temperature",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "See more",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 210,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () {},
                              child: const Text(
                                '>',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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

Widget foreCastCard() => Column(
      children: <Widget>[
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
          height: 14,
        ),
        Row(
          children: <Widget>[
            const SizedBox(width: 20),
            const Text(
              "Today",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.sunny,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            const Text(
              "15°",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(width: 10),
            Container(
              height: 10,
              width: 130,
              // color: Colors.yellow,
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(
                  color: Colors.white54,
                  // width: 350,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "29°",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
