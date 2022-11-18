import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeelsLikeWidget extends StatelessWidget {
  const FeelsLikeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 15.0.h),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                const Icon(
                  Icons.thermostat,
                  color: Colors.white,
                ),
                Text(
                  " FEELS LIKE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
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
