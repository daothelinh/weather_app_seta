import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 18.0.h),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20.w,
                  ),
                  const Icon(
                    Icons.thermostat,
                    color: Colors.white,
                  ),
                  Text(
                    "Temperature",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
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
