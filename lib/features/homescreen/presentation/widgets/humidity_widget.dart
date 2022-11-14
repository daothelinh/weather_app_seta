import 'package:flutter/material.dart';

class HumidityWidget extends StatelessWidget {
  const HumidityWidget({super.key});
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
                  Icons.waves,
                  color: Colors.white,
                ),
                Text(
                  " HUMIDIBITY",
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
