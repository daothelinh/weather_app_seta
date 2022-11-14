import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
    );
  }
}
