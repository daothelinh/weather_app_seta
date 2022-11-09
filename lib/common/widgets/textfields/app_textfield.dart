import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:kowil/common/index.dart';

// import '../../../gen/assets.gen.dart';

// enum TextFieldState {
//   none,
//   validateSucceeded,
//   validateFailed,
//   showMessage,
// }

// class AppTextField extends StatefulWidget {
//   final TextEditingController? controller;
//   final double radius;
//   final Color borderColor;
//   final Color focusBorderColor;
//   final Color? cursorColor;
//   final Color? backgroundColor;
//   final TextStyle? textStyle;
//   final String? hintText;
//   final String? initText;
//   final TextStyle? hintStyle;
//   final TextInputType? keyboardType;
//   final bool readOnly;
//   final FocusNode? focusNode;

//   final Function(String)? onChanged;

//   /// Widget in the bubble
//   final Widget? messageContent;

//   ///flag to show/ hide content in text field
//   final bool isPassword;

//   ///flag to determine state of text field
//   final TextFieldState state;

//   ///Error text below the text field
//   final String? errorText;
//   const AppTextField({
//     Key? key,
//     this.controller,
//     this.readOnly = false,
//     this.radius = 8,
//     this.borderColor = AppColors.stroke,
//     this.focusBorderColor = AppColors.deepDark,
//     this.textStyle,
//     this.cursorColor,
//     this.backgroundColor,
//     this.hintText,
//     this.hintStyle,
//     this.isPassword = false,
//     this.state = TextFieldState.none,
//     this.errorText,
//     this.messageContent,
//     this.keyboardType,
//     this.initText,
//     this.onChanged,
//     this.focusNode,
//   }) : super(key: key);

//   @override
//   State<AppTextField> createState() => _AppTextFieldState();
// }

// class _AppTextFieldState extends State<AppTextField> {
//   late TextEditingController _controller;
//   bool isObscure = false;
//   bool isFocus = false;

//   late TextStyle _textStyle;
//   late TextFieldState _state;

//   @override
//   void initState() {
//     isObscure = widget.isPassword;
//     _textStyle = widget.textStyle ?? AppStyles.h5Input13ptLight;
//     _state = widget.state;
//     _controller =
//         widget.controller ?? TextEditingController(text: widget.initText);
//     super.initState();
//   }

//   void _toggleObscure() {
//     setState(() {
//       isObscure = !isObscure;
//     });
//   }

//   void _onFocusChange(bool val) {
//     setState(() {
//       isFocus = val;
//     });
//   }

//   @override
//   void didUpdateWidget(AppTextField oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.state != widget.state) {
//       setState(() {
//         _state = widget.state;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: widget.backgroundColor,
//             borderRadius: BorderRadius.circular(widget.radius),
//             border: Border.all(
//               color: _borderColor,
//             ),
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Focus(
//                   onFocusChange: _onFocusChange,
//                   child: TextField(
//                     onChanged: widget.onChanged,
//                     readOnly: widget.readOnly,
//                     cursorColor: widget.cursorColor ?? Colors.black,
//                     obscureText: isObscure,
//                     obscuringCharacter: '●',
//                     keyboardType: widget.keyboardType,
//                     scrollPadding: EdgeInsets.zero,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       enabledBorder: InputBorder.none,
//                       errorBorder: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                       contentPadding: EdgeInsets.zero,
//                       isCollapsed: true,
//                       hintText: widget.hintText ?? "",
//                       hintStyle: widget.hintStyle ??
//                           AppStyles.h5Input13ptLight.copyWith(
//                             color: AppColors.deepDark.withOpacity(0.5),
//                           ),
//                     ),
//                     style: _textStyle.copyWith(color: _textColor),
//                     controller: _controller,
//                   ),
//                 ),
//               ),
//               if (_state == TextFieldState.validateSucceeded)
//                 Padding(
//                   padding: EdgeInsets.only(right: 8.0.w),
//                   child: Assets.svg.icDone.svg(),
//                 ),
//               if (_state == TextFieldState.validateFailed)
//                 Padding(
//                   padding: EdgeInsets.only(right: 8.0.w),
//                   child: Assets.svg.icError.svg(),
//                 ),
//               if (widget.isPassword)
//                 InkWell(
//                   onTap: _toggleObscure,
//                   child: isObscure
//                       ? Assets.svg.icEye.svg()
//                       : Assets.svg.icEyeOff.svg(),
//                 ),
//             ],
//           ),
//         ),
//         if ((widget.errorText ?? "").isNotEmpty &&
//             _state == TextFieldState.validateFailed)
//           Padding(
//             padding: EdgeInsets.only(top: 8.0.h),
//             child: Text(
//               widget.errorText!,
//               style: AppStyles.h612ptRegular,
//             ),
//           ),
//         if (_state == TextFieldState.showMessage)
//           MessageBubble(
//             onTapClose: () {
//               setState(() {
//                 _state = TextFieldState.none;
//               });
//             },
//             child: widget.messageContent ?? const SizedBox.shrink(),
//           )
//       ],
//     );
//   }

//   Color get _borderColor {
//     if (_state == TextFieldState.validateFailed) {
//       return AppColors.alertError;
//     }
//     if (_state == TextFieldState.showMessage) {
//       return AppColors.brandingOwen;
//     }
//     if (isFocus) {
//       return widget.focusBorderColor;
//     } else {
//       return widget.borderColor;
//     }
//   }

//   Color get _textColor {
//     if (_state == TextFieldState.validateFailed) {
//       return AppColors.alertError;
//     }
//     return _textStyle.color ?? AppColors.deepDark;
//   }
// }

// class MessageBubble extends StatelessWidget {
//   final Widget child;
//   final Function() onTapClose;
//   const MessageBubble({
//     Key? key,
//     required this.child,
//     required this.onTapClose,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 2.h),
//       child: CustomPaint(
//         painter: BubblePainter(),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     child,
//                   ],
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: onTapClose,
//               child: Padding(
//                 padding: EdgeInsets.only(top: 14.0.h, right: 2.w),
//                 child: const Icon(
//                   Icons.close,
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../index.dart';

enum TextFieldState {
  none,
  validateSucceeded,
  validateFailed,
}

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final double radius;
  final Color borderColor;
  final Color focusBorderColor;
  final Color? cursorColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String? hintText;
  final String? initText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final bool readOnly;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool? autofocus;
  final Function()? onTap;

  final Function(String)? onChanged;

  ///flag to show/ hide content in text field
  final bool isPassword;

  ///flag to determine state of text field
  final TextFieldState state;

  ///Error text below the text field
  final String? errorText;

  const AppTextField({
    Key? key,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.radius = 8,
    this.borderColor = Colors.black,
    this.focusBorderColor = Colors.white,
    this.textStyle,
    this.cursorColor,
    this.backgroundColor,
    this.maxLength,
    this.hintText,
    this.hintStyle,
    this.isPassword = false,
    this.state = TextFieldState.none,
    this.errorText,
    this.inputFormatters,
    this.keyboardType,
    this.initText,
    this.onChanged,
    this.focusNode,
    this.autofocus,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _controller;
  bool isObscure = false;
  bool isFocus = false;
  String _text = "";
  late TextStyle _textStyle;
  late TextFieldState _state;

  @override
  void initState() {
    isObscure = widget.isPassword;
    _textStyle =
        widget.textStyle ?? AppStyles.t16p.copyWith(color: AppColors.inkA500);
    _state = widget.state;
    _controller =
        widget.controller ?? TextEditingController(text: widget.initText);
    super.initState();
  }

  void _toggleObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void _onFocusChange(bool val) {
    setState(() {
      isFocus = val;
    });
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state != widget.state) {
      setState(() {
        _state = widget.state;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48.sp,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.radius),
              border: Border.all(
                color: _borderColor,
              ),
            ),
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('hihi'),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Focus(
                      onFocusChange: _onFocusChange,
                      child: TextField(
                        // onTap: widget.onTap,
                        // textAlign: TextAlign.center,
                        // textAlignVertical: TextAlignVertical.center,
                        onChanged: (text) {
                          widget.onChanged?.call(text);
                          setState(() {
                            _text = text;
                          });
                        },
                        autofocus: widget.autofocus ?? false,
                        readOnly: widget.readOnly,
                        cursorColor: widget.cursorColor ?? Colors.black,
                        obscureText: isObscure,
                        obscuringCharacter: '●',
                        keyboardType: widget.keyboardType,
                        scrollPadding: EdgeInsets.zero,
                        inputFormatters: [
                          ...?widget.inputFormatters,
                          LengthLimitingTextInputFormatter(widget.maxLength),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          // isCollapsed: true,
                          labelText: widget.hintText ?? "",
                          labelStyle:
                              AppStyles.t16p.copyWith(color: AppColors.inkA400),
                          hintText: widget.hintText ?? "",
                          // hintStyle: widget.hintStyle ??
                          //     AppStyles.t16l.copyWith(color: AppColors.inkA400),
                        ),
                        style: _textStyle.copyWith(color: _textColor),
                        controller: _controller,
                      ),
                    ),
                  ),
                ),
                if (_text.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.clear();
                        _text = "";
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4.0.w),
                      child: Assets.svg.icCloseCircle
                          .svg(height: 16.w, width: 16.w),
                    ),
                  ),
                if (widget.isPassword)
                  GestureDetector(
                    onTap: _toggleObscure,
                    child: Padding(
                      padding: EdgeInsets.all(4.0.w),
                      child: isObscure
                          ? Assets.svg.icShow.svg(height: 16.w, width: 16.w)
                          : Assets.svg.icHide.svg(height: 16.w, width: 16.w),
                    ),
                  ),
              ],
            ),
          ),
          if ((widget.errorText ?? "").isNotEmpty &&
              _state == TextFieldState.validateFailed)
            Padding(
              padding: EdgeInsets.only(top: 0.0.h),
              child: Text(
                widget.errorText!,
                style: AppStyles.t16p
                    .copyWith(fontSize: 14, color: AppColors.redA500),
              ),
            ),
        ],
      ),
    );
  }

  Color get _borderColor {
    if (_state == TextFieldState.validateFailed) {
      return AppColors.redA500;
    }
    if (isFocus) {
      return widget.focusBorderColor;
    } else {
      return widget.borderColor;
    }
  }

  Color get _textColor {
    if (_state == TextFieldState.validateFailed) {
      return AppColors.redA500;
    }
    return _textStyle.color ?? AppColors.inkA500;
  }
}
