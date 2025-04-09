import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late S lang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Kurbandaş",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.g_mobiledata),
              label: Text(lang.SigninwithGoogle),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16))),
        )
      ],
    );
  }
}
