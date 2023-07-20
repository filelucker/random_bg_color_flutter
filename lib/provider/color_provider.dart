import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants/colors.dart';

class ColorProvider extends ChangeNotifier {
  Color backgroundColor = ProjectColors.white;

  void changeBackgroundColor() {
    backgroundColor = Color.fromARGB(255,
      Random.secure().nextInt(256),
      Random.secure().nextInt(256),
      Random.secure().nextInt(256),
    );
    changeNavStat();
    notifyListeners();
  }

  void changeNavStat() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: getColorBrightness(backgroundColor)
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: getColorBrightness(backgroundColor)
            ? Brightness.dark
            : Brightness.light));
  }

  bool getColorBrightness(Color color) {
    return color.computeLuminance() >= 0.5 ? true : false;
  }
}