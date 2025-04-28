import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';

class LogoutConfirmationDialog extends StatefulWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  State<LogoutConfirmationDialog> createState() =>
      _LogoutConfirmationDialogState();
}

class _LogoutConfirmationDialogState extends State<LogoutConfirmationDialog> {
  late S lang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(lang.logout),
      content: Text(lang.logoutConfirmation),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(lang.cancel)),
        TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              lang.logout,
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
  }
}
