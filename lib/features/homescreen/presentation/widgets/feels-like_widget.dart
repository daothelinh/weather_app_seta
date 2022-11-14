import 'package:flutter/material.dart';

class FeelsLikeWidget extends StatelessWidget {
  const FeelsLikeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.thermostat,
                  color: Colors.white,
                ),
                Text(
                  " FEELS LIKE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
