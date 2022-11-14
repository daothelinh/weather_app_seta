import 'package:flutter/material.dart';

class WindWidget extends StatelessWidget {
  const WindWidget({super.key});
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
                  Icons.air,
                  color: Colors.white,
                ),
                Text(
                  " WIND",
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
