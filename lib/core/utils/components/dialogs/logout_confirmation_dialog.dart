import 'package:flutter/material.dart';
import 'package:kurbandas/core/utils/extensions/context_extensions.dart';
import 'package:kurbandas/generated/l10n.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  LogoutConfirmationDialog({super.key});

  late S lang;

  @override
  Widget build(BuildContext context) {
    lang = S.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: context.dynamicWidth(.85),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: const Icon(Icons.logout)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  lang.logout,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[850]),
                ),
              )
            ]),
            const SizedBox(height: 16),
            Text(
              lang.logoutConfirmation,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            const SizedBox(height: 24),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      lang.logout,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      lang.cancel,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
              )
            ])
          ],
        ),
      ),
    );
  }
}
