// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AuthStore authStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    authStore = Provider.of<RootStore>(context).authStore;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(currentUser);
  }

  Future currentUser(Duration timeStamp) async {
    try {
      await authStore.currentUser();
      if (authStore.isLoggedIn) {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.login);
      }
    } catch (e) {
      await authStore.logout();

      if (mounted) {
        showSnackBar(context, text: e.toString());
      }

      await currentUser(timeStamp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
