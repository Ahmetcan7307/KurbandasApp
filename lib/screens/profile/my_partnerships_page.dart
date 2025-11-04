import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/utils/components/kurban/action_button.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/url_launcher_store.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';

class MyPartnershipsPage extends StatefulWidget {
  const MyPartnershipsPage({super.key});

  @override
  State<MyPartnershipsPage> createState() => _MyPartnershipsPageState();
}

class _MyPartnershipsPageState extends State<MyPartnershipsPage> {
  bool isLoading = true;

  late KurbanStore kurbanStore;
  late UrlLauncherStore urlLauncherStore;

  late S lang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    RootStore rootStore = Provider.of<RootStore>(context);
    kurbanStore = rootStore.kurbanStore;
    urlLauncherStore = rootStore.urlLauncherStore;

    lang = S.of(context);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await kurbanStore.getMyPartnerships();

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    if (kurbanStore.myPartnerships!.isEmpty) {
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
              lang.noPartnerships,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              lang.noPartnershipsDesc,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      );
    }

    return ListView.builder(
        itemCount: kurbanStore.myPartnerships!.length,
        itemBuilder: (context, index) =>
            buildShareCard(kurbanStore.myPartnerships![index]));
  }

  Widget buildShareCard(Kurban kurban) => Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 2,
        child: InkWell(
          onTap: () => navigateToDetail(kurban.documentId!),
          child: Column(
            children: [
              buildHeader(kurban),
              const Divider(),
              buildActionButtons(kurban.owner!.phoneNo!)
            ],
          ),
        ),
      );

  void navigateToDetail(String documentId) {
    kurbanStore.selectPartnership(documentId);

    Navigator.pushNamed(context, Routes.kurbanDetail);
  }

  Widget buildHeader(Kurban kurban) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: .1)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                kurban.animal!.name!.substring(0, 1),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kurban.animal!.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${lang.cutAddress}: ${kurban.addressStr}",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  color: kurbanStore.getStatusColor(status: kurban.status!),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                kurbanStore.getKurbanStatus(lang, kurbanStatus: kurban.status!),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            )
          ],
        ),
      );

  Widget buildActionButtons(String phoneNo) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ActionButton(
                icon: Icons.phone,
                label: lang.call,
                onTap: () => call(phoneNo)),
            ActionButton(
                icon: Icons.message,
                label: lang.message,
                onTap: () => message(phoneNo))
          ],
        ),
      );

  Future call(String phoneNo) async =>
      await urlLauncherStore.launchTel(phoneNo);

  Future message(String phoneNo) async =>
      await urlLauncherStore.launchSms(phoneNo);
}
