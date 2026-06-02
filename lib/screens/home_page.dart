// ignore_for_file: use_build_context_synchronously
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kurbandas/core/const/developer_info_cons.dart';
import 'package:kurbandas/core/utils/components/filter_bottom_sheet.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_list.dart';
import 'package:kurbandas/core/utils/extensions/context_extensions.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:kurbandas/stores/url_launcher_store.dart';
import 'package:provider/provider.dart';

import '../core/utils/extensions/widget_extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late S lang;

  late TabController tabController;

  late KurbanStore kurbanStore;
  late AuthStore authStore;
  late UrlLauncherStore urlLauncherStore;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance
        .addPostFrameCallback((_) => showAppInfoDialog(context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    RootStore rootStore = Provider.of<RootStore>(context);
    kurbanStore = rootStore.kurbanStore;
    authStore = rootStore.authStore;
    urlLauncherStore = rootStore.urlLauncherStore;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void showAppInfoDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        ThemeData theme = Theme.of(context);

        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: theme.primaryColor,
              ),
              SizedBox(width: 10),
              Text(
                lang.endingAppTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: context.dynamicHeight(.6),
                maxWidth: context.dynamicWidth(.9)),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 8),
                child: RichText(
                    text: TextSpan(
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontSize: 14, height: 1.5),
                        children: [
                      TextSpan(text: lang.endingAppContent1),
                      WidgetSpan(
                          child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildBulletPoint(
                                theme, lang.endingAppContentBulletPoint1),
                            buildBulletPoint(
                                theme, lang.endingAppContentBulletPoint2),
                            buildBulletPoint(
                                theme, lang.endingAppContentBulletPoint3)
                          ],
                        ),
                      )),
                      TextSpan(text: lang.endingAppContent2),
                      TextSpan(
                          text: DeveloperInfoCons.url,
                          style: TextStyle(
                              color: theme.colorScheme.primary,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = launchDeveloperInfoUrl),
                    ])),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                    foregroundColor: theme.primaryColor,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                child: Text(lang.ok))
          ],
        );
      });

  Widget buildBulletPoint(ThemeData theme, String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.circle,
              size: 6,
              color: theme.primaryColor,
            ).applyPadding(top: 6),
            const SizedBox(width: 8),
            Expanded(
                child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.3),
            ))
          ],
        ),
      );

  Future launchDeveloperInfoUrl() async =>
      await urlLauncherStore.launchStore(Uri.parse(DeveloperInfoCons.url));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Kurbandaş",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: showFilterBottomSheet,
              icon: const Icon(
                Icons.filter_list,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, Routes.profile),
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: TabBar(
              controller: tabController,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withValues(alpha: .7),
              tabs: [Tab(text: lang.active), Tab(text: lang.completed)]),
        ),
      ),
      body: Observer(builder: (context) {
        return Column(
          children: [
            // Aktif filtreler
            if (kurbanStore.filter != null)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Theme.of(context).primaryColor.withValues(alpha: .1),
                child: Row(
                  children: [
                    const Icon(
                      Icons.filter_alt,
                      size: 18,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${lang.filters}:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            if (kurbanStore.filter!.animal != null)
                              buildFilterChip(
                                  kurbanStore.filter!.animal!.name!),
                            if (kurbanStore.filter!.selectedProvince != null)
                              buildFilterChip(
                                  kurbanStore.filter!.selectedProvince!.name),
                            if (kurbanStore.filter!.selectedDistrict != null)
                              buildFilterChip(
                                  kurbanStore.filter!.selectedDistrict!.name)
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: clearFilter,
                      icon: Icon(
                        Icons.clear,
                        size: 18,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    )
                  ],
                ),
              ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  KurbanList(isActive: true),
                  KurbanList(isActive: false)
                ],
              ),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToCreate,
        icon: const Icon(Icons.add),
        label: Text(lang.shareQurbani),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
      ),
    );
  }

  Future showFilterBottomSheet() async {
    if (await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            builder: (context) => FilterBottomSheet()) as bool? ??
        false) {
      setState(() {});
    }
  }

  Widget buildFilterChip(String label) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Chip(
          label: Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        ),
      );

  dynamic clearFilter() => kurbanStore.clearFilter();

  Future navigateToCreate() async {
    if (await authStore.checkPhoneNo(context)) {
      await Navigator.pushNamed(context, Routes.createKurban);

      kurbanStore.selectedPhotos.clear();

      setState(() {});
    }
  }
}
