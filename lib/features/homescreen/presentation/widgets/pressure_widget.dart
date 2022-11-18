import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PressureWidget extends StatelessWidget {
  const PressureWidget({super.key});
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
                  Icons.attribution,
                  color: Colors.white,
                ),
                Text(
                  " PRESSURE",
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
