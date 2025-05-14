// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_card.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

import '../../core/utils/components/kurban/action_button.dart';

class MyKurbansPage extends StatefulWidget {
  const MyKurbansPage({super.key});

  @override
  State<MyKurbansPage> createState() => _MyKurbansPageState();
}

class _MyKurbansPageState extends State<MyKurbansPage> {
  bool isLoading = true;

  late KurbanStore kurbanStore;

  late S lang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    kurbanStore = Provider.of<RootStore>(context).kurbanStore;

    lang = S.of(context);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await kurbanStore.getMyKurbans();

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (kurbanStore.myKurbans!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sentiment_dissatisfied,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              lang.noMyQurbaniAds,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              lang.noMyQurbaniAdsDesc,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: kurbanStore.getMyKurbans,
      child: Observer(builder: (context) {
        return ListView.builder(
            itemCount: kurbanStore.myKurbans!.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              Kurban kurban = kurbanStore.myKurbans![index];
              return Column(
                children: [
                  KurbanCard(
                    kurban: kurban,
                    onTap: () => kurbanStore.selectKurban(true, true, index),
                  ),
                  buildActionButtons(
                      kurban.documentId!, kurban.animal!.name!, index),
                  const SizedBox(height: 16)
                ],
              );
            });
      }),
    );
  }

  Widget buildActionButtons(String documentId, String animalName, int index) =>
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ActionButton(
                icon: Icons.people,
                label: lang.Requests,
                onTap: () {
                  kurbanStore.selectKurban(true, true, index);
                  Navigator.pushNamed(context, Routes.kurbanRequests);
                }),
            ActionButton(
                icon: Icons.edit,
                label: lang.edit,
                onTap: () async {
                  kurbanStore.selectKurban(true, true, index);

                  if (await Navigator.pushNamed(context, Routes.editKurban)
                          as bool? ??
                      false) {
                    setState(() {});
                  }
                }),
            ActionButton(
                icon: Icons.delete,
                label: lang.delete,
                color: Colors.red,
                onTap: () => delete(animalName, documentId))
          ],
        ),
      );

  Future delete(String animalName, String documentId) async {
    if (await showDialog<bool>(
            context: context,
            builder: (context) => buildAreYouSureDeleteAlertDialog(animalName))
        as bool) {
      setState(() {
        isLoading = true;
      });

      await kurbanStore.delete(documentId);

      showSnackBar(context, text: lang.QurbaniPostDeleted);

      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildAreYouSureDeleteAlertDialog(String animalName) => AlertDialog(
        title: Text(lang.deleteQurbani),
        content: SingleChildScrollView(
          child: ListBody(children: [
            Text(lang.areYouSureDeleteQurbani(animalName.toString())),
            const SizedBox(height: 8),
            Text(
              lang.areYouSureDeleteQurbaniDesc,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ]),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(lang.cancel)),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                lang.delete,
                style: TextStyle(color: Colors.red),
              ))
        ],
      );
}
