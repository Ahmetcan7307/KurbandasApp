import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget applyPadding({double top = 0}) =>
      Padding(padding: EdgeInsets.only(top: top), child: this);
}
