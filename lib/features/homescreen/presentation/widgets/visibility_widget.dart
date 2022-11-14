import 'package:flutter/material.dart';

class VisibilityWidget extends StatelessWidget {
  const VisibilityWidget({super.key});
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
                  Icons.remove_red_eye,
                  color: Colors.white,
                ),
                Text(
                  " VISIBILITY",
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
