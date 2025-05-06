import 'package:flutter/material.dart';

class CreateKurbanLocationPage extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;

  const CreateKurbanLocationPage(
      {super.key, required this.onContinue, required this.onBack});

  @override
  State<CreateKurbanLocationPage> createState() =>
      _CreateKurbanLocationPageState();
}

class _CreateKurbanLocationPageState extends State<CreateKurbanLocationPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
