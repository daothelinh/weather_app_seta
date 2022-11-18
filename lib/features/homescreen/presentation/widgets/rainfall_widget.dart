import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RainfallWidget extends StatelessWidget {
  const RainfallWidget({super.key});
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
                  Icons.water_drop,
                  color: Colors.white,
                ),
                Text(
                  " RAINFALL",
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
