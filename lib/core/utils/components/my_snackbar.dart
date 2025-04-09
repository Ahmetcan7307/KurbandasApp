import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
        BuildContext context,
        {required String text,
        Color color = Colors.grey,
        int seconds = 10}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: seconds),
        backgroundColor: color,
        content: Text(text)));
