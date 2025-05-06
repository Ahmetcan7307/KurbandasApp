import 'package:flutter/material.dart';

class CreateKurbanPreviewPage extends StatefulWidget {
  final VoidCallback onSubmit;
  final VoidCallback onBack;

  const CreateKurbanPreviewPage(
      {super.key, required this.onSubmit, required this.onBack});

  @override
  State<CreateKurbanPreviewPage> createState() =>
      _CreateKurbanPreviewPageState();
}

class _CreateKurbanPreviewPageState extends State<CreateKurbanPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
