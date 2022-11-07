import 'package:flutter/material.dart';

class ForeCastDayWG extends StatefulWidget {
  const ForeCastDayWG({super.key});

  @override
  State<ForeCastDayWG> createState() => _ForeCastDayWGState();
}

class _ForeCastDayWGState extends State<ForeCastDayWG> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

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
