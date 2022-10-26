import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
    this.controller,
    this.hintText,
    this.onChange,
    this.onTap,
  });
  TextEditingController? controller;
  String? hintText;
  Function(String)? onChange;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      onChanged: onChange,
      cursorColor: Colors.white.withOpacity(0.6),
      style: TextStyle(
        color: Colors.white,
        backgroundColor: Colors.transparent,
        fontSize: 20.sp,
      ),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(Icons.search, color: Colors.white.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.4),
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.8),
            width: 1.w,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        hintText: hintText != null ? hintText! : '',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.3),
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
