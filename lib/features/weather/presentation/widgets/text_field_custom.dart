import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/index.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key, this.onTap, this.controller});
  final Function()? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: AppColors.white),
        hintText: 'title_search'.tr(),
        hintStyle: AppStyles.t16p.copyWith(
          color: Colors.white.withOpacity(0.5),
          fontSize: 20.sp,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white.withOpacity(0.5)),
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white.withOpacity(0.5)),
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
      ),
    );
  }
}