import 'package:base_bloc_3/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForeCastTimeWG extends StatefulWidget {
  const ForeCastTimeWG({super.key});

  @override
  State<ForeCastTimeWG> createState() => _ForeCastTimeWGState();
}

class _ForeCastTimeWGState extends State<ForeCastTimeWG> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 18),
          child: Text(
            " Cloudy conditions from 1AM-9AM, with showers expected at 9AM. ",
            style:
                TextStyle(color: Colors.white, fontFamily: FontFamily.lexend),
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
