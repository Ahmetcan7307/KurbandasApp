// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kurbandas/core/utils/components/filter_bottom_sheet.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_list.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    RootStore rootStore = Provider.of<RootStore>(context);
    kurbanStore = rootStore.kurbanStore;
    authStore = rootStore.authStore;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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

  clearFilter() => kurbanStore.clearFilter();

  Future navigateToCreate() async {
    if (await authStore.checkPhoneNo(context)) {
      await Navigator.pushNamed(context, Routes.createKurban);

      kurbanStore.selectedPhotos.clear();

      setState(() {});
    }
  }
}
