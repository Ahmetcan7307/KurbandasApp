// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:provider/provider.dart';

import '../../core/utils/components/dialogs/logout_confirmation_dialog.dart';
import '../../core/utils/components/my_snackbar.dart';
import '../../routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        title: Text(lang.settings),
      ),
      body: ListView(children: [
        buildSection(title: lang.app, items: [
          buildItem(
              icon: Icons.info,
              title: lang.info,
              onTap: () => Navigator.pushNamed(
                    context,
                    Routes.about,
                  )),
          buildItem(
              icon: Icons.help,
              title: lang.help,
              onTap: () => Navigator.pushNamed(
                    context,
                    Routes.help,
                  ))
        ]),
        buildSection(title: lang.AccountOperations, items: [
          buildItem(
              icon: Icons.logout,
              title: lang.logout,
              titleColor: Colors.red,
              onTap: () => logoutOnPressed(context))
        ])
      ]),
    );
  }

  Widget buildSection({required String title, required List<Widget> items}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          ...items
        ],
      );

  Widget buildItem(
          {required IconData icon,
          required String title,
          String? subTitle,
          Color? titleColor,
          required VoidCallback onTap}) =>
      ListTile(
        leading: Icon(
          icon,
          color: titleColor ?? Colors.grey.shade700,
        ),
        title: Text(
          title,
          style: TextStyle(color: titleColor, fontWeight: FontWeight.w500),
        ),
        subtitle: subTitle != null ? Text(subTitle) : null,
        trailing: const Icon(
          Icons.chevron_right,
          size: 22,
        ),
        onTap: onTap,
      );

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
