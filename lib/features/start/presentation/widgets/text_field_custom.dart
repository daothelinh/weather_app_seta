import 'package:base_bloc_3/common/app_theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../common/app_theme/app_colors.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({
    Key? key,
    this.textEditingController,
    this.onEditingComplete,
    this.onChanged,
  }) : super(key: key);
  TextEditingController? textEditingController = TextEditingController();
  // VoidCallback? onChanged;
  // Function? onChanged;
  Function()? onEditingComplete;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      style: AppStyles.t16b.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.colore51937,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Searching',
      ),
      controller: textEditingController,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      keyboardType: TextInputType.none,
    );
  }
}
