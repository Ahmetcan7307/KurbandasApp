// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:provider/provider.dart';

import '../../core/utils/components/my_snackbar.dart';
import '../../routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green.shade300, Colors.green.shade700])),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.pets,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 24),
              const Text(
                "Kurbandaş",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(
                lang.findPartnersQurbani,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 80),
              ElevatedButton.icon(
                onPressed: signInWithGoogle,
                icon: Image.asset(
                  "assets/images/google_logo.png",
                  height: 24,
                ),
                label: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    lang.SigninwithGoogle,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 4),
              ),
              const SizedBox(height: 24),
              if (isLoading)
                const CircularProgressIndicator(
                  color: Colors.white,
                )
            ],
          ),
        )),
      ),
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
