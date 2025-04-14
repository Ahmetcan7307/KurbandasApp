// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:provider/provider.dart';

import '../../../routes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late S lang;

  late AuthStore authStore;

  bool isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    authStore = Provider.of<RootStore>(context).authStore;
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
        isLoading
            ? const CircularProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: signInWithGoogle,
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

  Future signInWithGoogle() async {
    setState(() {
      isLoading = true;
    });

    try {
      await authStore.signInWithGoogle();

      if (authStore.isLoggedIn) {
        Routes.navigateAndRemoveUntil(Routes.home);
      }
    } catch (e) {
      showSnackBar(context, text: e.toString());
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
