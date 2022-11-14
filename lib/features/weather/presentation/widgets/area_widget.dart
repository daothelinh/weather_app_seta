import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/index.dart';
import '../argument/area.dart';

class AreaWidget extends StatelessWidget {
  const AreaWidget({super.key, this.area});

  final Area? area;

  convertFtoC(double f) {
    return ((f - 32) * 5 / 9).floor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        // color: Colors.white.withOpacity(0.5),
        image: DecorationImage(
          image: const NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.dstATop),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Location',
                      style: AppStyles.t16p.copyWith(
                        color: AppColors.white,
                        fontSize: 30.sp,
                      ),
                    ),
                    Text(
                      'Seongnam-si',
                      style: AppStyles.t16p.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 200.h,
                  child: Text('${area?.location?.weatherText}',
                      style: AppStyles.t16p, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('${area?.location?.temperature?.metric?.value}°',
                      style: AppStyles.t16p.copyWith(fontSize: 40)),
                ),
                Text(
                    'H:${convertFtoC(area?.forecastTime?.dailyForecasts?[0].temperature?.maximum?.value ?? 0)}° L:${convertFtoC(area?.forecastTime?.dailyForecasts?[0].temperature?.minimum?.value ?? 0)}°',
                    style: AppStyles.t16p),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
