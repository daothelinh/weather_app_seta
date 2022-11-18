import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UVIndexWidget extends StatelessWidget {
  const UVIndexWidget({super.key});
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
                  Icons.sunny,
                  color: Colors.white,
                ),
                Text(
                  " UV INDEX",
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
