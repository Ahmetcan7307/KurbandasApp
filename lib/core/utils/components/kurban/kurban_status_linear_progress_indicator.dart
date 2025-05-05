import 'package:flutter/material.dart';

class KurbanStatusLinearProgressIndicator extends StatelessWidget {
  final int totalPartnersCount;
  final int remainPartnersCount;
  final double minHeight;
  final Color backgroundColor;
  final Color valueColor;

  const KurbanStatusLinearProgressIndicator(
      {super.key,
      required this.totalPartnersCount,
      required this.remainPartnersCount,
      required this.minHeight,
      required this.backgroundColor,
      required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: (totalPartnersCount - remainPartnersCount) / totalPartnersCount,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
        minHeight: minHeight,
      ),
    );
  }
}
