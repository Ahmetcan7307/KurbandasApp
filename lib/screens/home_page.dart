// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:kurbandas/core/utils/components/dialogs/logout_confirmation_dialog.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_list.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late S lang;

  late AuthStore authStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    authStore = Provider.of<RootStore>(context).authStore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kurbandaş",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => logoutOnPressed(context),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).primaryColor.withValues(alpha: .1),
            child: Row(children: [
              const Icon(
                Icons.info_outline,
                color: Colors.green,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  lang.findPartnersQurbani,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ]),
          ),
          Expanded(child: const KurbanList())
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, Routes.createKurban),
        icon: const Icon(Icons.add),
        label: Text(lang.newQurbani),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Future logoutOnPressed(BuildContext context) async {
    if (await showDialog(
        context: context,
        builder: (context) => LogoutConfirmationDialog()) as bool) {
      showSnackBar(context, text: lang.SigningOut, seconds: 2);

      await authStore.logout();

      Navigator.pushReplacementNamed(context, Routes.login);
    }
  }
}
