import 'package:flutter/cupertino.dart';

extension MediaQueryExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;

  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
}
