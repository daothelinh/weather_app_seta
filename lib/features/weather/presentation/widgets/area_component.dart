import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/features/weather/domain/entity/area_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';

class AreaComponent extends StatelessWidget {
  AreaComponent({super.key, this.area, this.index = 0});
  AreaEntity? area;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 335.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
        // color: Colors.red,
        image: DecorationImage(
          image: NetworkImage(
            index % 2 == 1
                ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'
                : 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
          ),
          fit: BoxFit.fill,
          opacity: 0.6,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Location',
                        style: AppStyles.t16p.copyWith(fontSize: 25.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text('Time',
                          style: AppStyles.t16p.copyWith(fontSize: 16.sp)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('35',
                          style: AppStyles.t16p.copyWith(fontSize: 40.sp)),
                      // Container(
                      //   height: 12.h,
                      //   width: 12.w,
                      //   decoration: BoxDecoration(
                      //     borderRadius:
                      //         BorderRadius.all(Radius.circular(12.sp)),
                      //     // color: AppColors.textColor,
                      //     color: Colors.green,
                      //   ),
                      //   child: Center(
                      //     child: Container(
                      //       height: 10.h,
                      //       width: 10.w,
                      //       decoration: BoxDecoration(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(10.sp)),
                      //         color: Colors.transparent,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      CustomPaint(
                        size: Size(12.w, 12.h),
                        painter: CirclePainter(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Partly Cloudy', style: AppStyles.t16p),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'H:29',
                            style: AppStyles.t16p.copyWith(fontSize: 15.sp),
                          ),
                          CustomPaint(
                            size: Size(4.w, 4.h),
                            painter: CirclePainter(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'L:15',
                            style: AppStyles.t16p.copyWith(fontSize: 15.sp),
                          ),
                          CustomPaint(
                            size: Size(4.w, 4.h),
                            painter: CirclePainter(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.white
    ..strokeWidth = 2
    // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
