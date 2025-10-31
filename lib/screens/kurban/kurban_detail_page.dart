// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_background_image.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_status_linear_progress_indicator.dart';
import 'package:kurbandas/core/utils/components/kurban/partners_list.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/core/utils/extensions/date_time_extensions.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/share_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:provider/provider.dart';

class KurbanDetailPage extends StatefulWidget {
  const KurbanDetailPage({super.key});

  @override
  State<KurbanDetailPage> createState() => _KurbanDetailPageState();
}

class _KurbanDetailPageState extends State<KurbanDetailPage> {
  late S lang;

  late KurbanStore kurbanStore;
  late AuthStore authStore;
  late ShareStore shareStore;

  bool isClickedRequestSend = false,
      isLoadingSendRequest = false,
      isLoading = true;
  late bool isRequestSend;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await kurbanStore.get(false);

      isRequestSend = await kurbanStore.isRequestSend();

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    RootStore rootStore = Provider.of<RootStore>(context);
    kurbanStore = rootStore.kurbanStore;
    authStore = rootStore.authStore;
    shareStore = rootStore.shareStore;
  }

  @override
  void dispose() {
    kurbanStore.nullSelectedKurban();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Observer(builder: (context) {
              return CustomScrollView(slivers: [
                buildSliverAppBar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${kurbanStore.selectedKurban!.animal!.name!} - ${kurbanStore.selectedKurban!.weight!} kg",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            buildStatusChip()
                          ],
                        ),
                        const SizedBox(height: 16),
                        buildCard([
                          Row(
                            children: [
                              const Icon(
                                Icons.currency_lira,
                                color: Colors.green,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "${lang.price}: ${kurbanStore.selectedKurban!.price} TL",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const Divider(),
                          buildInfoRow(lang.owner,
                              kurbanStore.selectedKurban!.owner!.fullName),
                          buildInfoRow(
                              lang.cutAddress,
                              kurbanStore.selectedKurban!.addressStr ??
                                  kurbanStore.selectedKurban!.address!
                                      .toString()),
                          buildInfoRow(
                              lang.cutDate,
                              kurbanStore.selectedKurban!.cutDate
                                      ?.formatDate() ??
                                  lang.noCutDate)
                        ]),
                        const SizedBox(height: 16),
                        buildCard([
                          Text(
                            lang.partnershipState,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          KurbanStatusLinearProgressIndicator(
                              totalPartnersCount: kurbanStore
                                  .selectedKurban!.totalPartnersCount!,
                              remainPartnersCount: kurbanStore
                                  .selectedKurban!.remainPartnersCount!,
                              minHeight: 10,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: Theme.of(context).primaryColor),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${lang.count}: ${kurbanStore.selectedKurban!.totalPartnersCount! - kurbanStore.selectedKurban!.remainPartnersCount!}",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${lang.remain}: ${kurbanStore.selectedKurban!.remainPartnersCount}",
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${lang.total}: ${kurbanStore.selectedKurban!.totalPartnersCount!}",
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ]),
                        const SizedBox(height: 24),
                        if (kurbanStore.selectedKurban!.status ==
                                KurbanStatus.waiting &&
                            kurbanStore.selectedKurban!.remainPartnersCount! >
                                0 &&
                            !kurbanStore.selectedKurban!.isMy! &&
                            !isClickedRequestSend &&
                            !isRequestSend)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: sendRequest,
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              label: !isLoadingSendRequest
                                  ? Text(lang.sendRequest)
                                  : CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  foregroundColor: Colors.white),
                            ),
                          ),
                        const SizedBox(height: 24),
                        Text(
                          lang.partners,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        PartnersList(
                            partners: kurbanStore.selectedKurban!.partners!)
                      ],
                    ),
                  ),
                )
              ]);
            }),
    );
  }

  Widget buildSliverAppBar() => SliverAppBar(
        expandedHeight: 250,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            kurbanStore.selectedKurban!.animal!.name!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          background: Stack(
            children: [
              // Eğer birden fazla fotoğraf varsa PageView ile göster
              if (kurbanStore.selectedKurban!.photoUrls != null &&
                  kurbanStore.selectedKurban!.photoUrls!.length > 1)
                PageView.builder(
                  itemCount: kurbanStore.selectedKurban!.photoUrls!.length,
                  itemBuilder: (context, index) {
                    return KurbanBackgroundImage(linearGradientColors: [
                      Colors.black.withValues(alpha: .3),
                      Colors.black.withValues(alpha: .5)
                    ], photoUrl: kurbanStore.selectedKurban!.photoUrls![index]);
                  },
                )
              // Tek fotoğraf varsa normal olarak göster
              else
                KurbanBackgroundImage(linearGradientColors: [
                  Colors.black.withValues(alpha: .3),
                  Colors.black.withValues(alpha: .5)
                ], photoUrl: kurbanStore.selectedKurban!.photoUrls![0]),

              // Sayfa göstergesi (indicator) ekle
              if (kurbanStore.selectedKurban!.photoUrls != null &&
                  kurbanStore.selectedKurban!.photoUrls!.length > 1)
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      kurbanStore.selectedKurban!.photoUrls!.length,
                      (index) => Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: .8),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: share, icon: Icon(Icons.share)),
          IconButton(onPressed: report, icon: Icon(Icons.flag))
        ],
      );

  Widget buildStatusChip() => Chip(
        label: Text(
          kurbanStore.getKurbanStatus(lang),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kurbanStore.getStatusColor(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 2,
      );

  Widget buildInfoRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      );

  Widget buildCard(List<Widget> children) => Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: children),
        ),
      );

  Future sendRequest() async {
    if (await authStore.checkPhoneNo(context)) {
      setState(() {
        isLoadingSendRequest = true;
      });

      try {
        await kurbanStore.sendRequest();

        showSnackBar(context,
            text: lang.SuccessfullySentRequest, color: Colors.green);
      } catch (e) {
        showSnackBar(context, text: "${lang.error}: $e");
      }

      setState(() {
        isLoadingSendRequest = false;
        isClickedRequestSend = true;
      });
    }
  }

  Future share() async => await shareStore.shareSystem(context);

  report() => Navigator.pushNamed(context, Routes.kurbanReport);
}
