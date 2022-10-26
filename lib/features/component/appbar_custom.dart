import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  AppBarCustom({
    Key? key,
    this.isBack = false,
    this.middle,
    this.trailing,
    this.isNoti = false,
    this.isSearch = false,
    // this.isActiveSearch = false,
    this.color,
    this.leading,
    this.callbackTrailing,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);
  final Size preferredSize;
  bool isBack;
  Widget? middle;
  Widget? trailing;
  Widget? leading;
  bool isNoti;
  bool isSearch;
  // bool isActiveSearch;
  Color? color;
  Function()? callbackTrailing;
  // Function(String) onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: isBack
          ? GestureDetector(
              onTap: () => context.router.pop(),
              child: Icon(CupertinoIcons.back),
            )
          : leading,
      middle: middle,
      trailing: isSearch
          ? GestureDetector(
              onTap: callbackTrailing
              // print('$isActiveSearch');
              ,
              child: Icon(Icons.search))
          : trailing,
      // trailing: trailing
    );
  }
}
