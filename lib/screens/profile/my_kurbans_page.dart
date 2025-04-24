import 'package:flutter/material.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_card.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

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
      child: ListView.builder(
          itemCount: kurbanStore.myKurbans!.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => Column(
                children: [
                  KurbanCard(
                    kurban: kurbanStore.myKurbans![index],
                    onTap: () {
                      // Todo
                    },
                  ),
                ],
              )),
    );
  }
}
