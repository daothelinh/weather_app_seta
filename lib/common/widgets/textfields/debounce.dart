import 'dart:async';

import 'package:flutter/animation.dart';

class Debounce {
  final int milliseconds;
  late VoidCallback textField;
  late Timer? _timer;

  Debounce({this.milliseconds = 500});
  void run(VoidCallback texField) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), texField);
  }

  void dispose() => _timer?.cancel();
}
