import 'package:flutter/material.dart';

class RainfallWidget extends StatelessWidget {
  const RainfallWidget({super.key});
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
                  Icons.water_drop,
                  color: Colors.white,
                ),
                Text(
                  " RAINFALL",
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
