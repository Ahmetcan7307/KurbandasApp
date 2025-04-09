import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../services/force_update_client.dart';
import '../../../stores/root_store.dart';
import '../../../stores/url_launcher_store.dart';

class ForceUpdate extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;
  final ForceUpdateClient client;
  final bool allowCancel;
  final void Function(Object error, StackTrace? stackTrace)? onException;

  const ForceUpdate(
      {super.key,
      required this.navigatorKey,
      required this.client,
      required this.allowCancel,
      this.onException,
      required this.child});

  @override
  State<ForceUpdate> createState() => _ForceUpdateState();
}

class _ForceUpdateState extends State<ForceUpdate> with WidgetsBindingObserver {
  bool isAlertVisible = false;

  late UrlLauncherStore urlLauncherStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    urlLauncherStore = Provider.of<RootStore>(context).urlLauncherStore;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    checkIfAppUpdateIsNeeded();
  }

  Future checkIfAppUpdateIsNeeded() async {
    if (isAlertVisible) {
      return;
    }

    try {
      String? storeUrl = await widget.client.getStoreUrl();
      if (storeUrl == null) {
        return;
      }
      if (await widget.client.isAppUpdateRequired()) {
        return await triggerForceUpdate(Uri.parse(storeUrl));
      }
    } catch (e, st) {
      if (widget.onException != null) {
        widget.onException!(e, st);
      } else {
        rethrow;
      }
    }
  }

  Future triggerForceUpdate(Uri storeUrl) async {
    isAlertVisible = true;
    bool? isSuccess = await showAlert(
        widget.navigatorKey.currentContext ?? context, widget.allowCancel);
    isAlertVisible = false;
    if (isSuccess == true) {
      await urlLauncherStore.launchStore(storeUrl);
    } else if (isSuccess == null && widget.allowCancel == false) {
      // * user clicked on the Android back button: show alert again
      return triggerForceUpdate(storeUrl);
    }
  }

  Future<bool?> showAlert(BuildContext context, bool allowCancel) async {
    S lang = S.of(context);

    return showAlertDialog(
        context: context,
        title: lang.appUpdateRequired,
        content: lang.pleaseUpdateToContinue,
        defaultActionText: lang.updateNow,
        cancelActionText: allowCancel ? lang.later : null);
  }

  Future<bool?> showAlertDialog(
          {required BuildContext context,
          required String title,
          required String content,
          String? cancelActionText,
          required String defaultActionText,
          bool isDestructive = false}) =>
      defaultTargetPlatform != TargetPlatform.iOS
          ? showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                      title: Text(title),
                      content: Text(content),
                      actions: [
                        if (cancelActionText != null)
                          TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text(cancelActionText)),
                        TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text(defaultActionText))
                      ]))
          : showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                    title: Text(title),
                    content: Text(content),
                    actions: [
                      if (cancelActionText != null)
                        CupertinoDialogAction(
                            child: Text(cancelActionText),
                            onPressed: () => Navigator.pop(context, false)),
                      CupertinoDialogAction(
                        isDestructiveAction: isDestructive,
                        child: Text(defaultActionText),
                        onPressed: () => Navigator.pop(context, true),
                      )
                    ],
                  ));

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkIfAppUpdateIsNeeded();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
