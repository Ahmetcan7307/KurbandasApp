import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';
import 'package:kurbandas/screens/profile/my_kurbans_page.dart';
import 'package:kurbandas/screens/profile/my_partnerships_page.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/supabase/auth_store.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late S lang;

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

    authStore = Provider.of<RootStore>(context).authStore;
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
        title: Text(lang.MyProfile),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, Routes.settings),
              icon: Icon(Icons.settings))
        ],
        bottom: TabBar(controller: tabController, tabs: [
          Tab(
            text: lang.myQurbanies,
          ),
          Tab(
            text: lang.MyPartnerships,
          )
        ]),
      ),
      body: Column(
        children: [
          buildProfileHeader(),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [const MyKurbansPage(), const MyPartnershipsPage()]),
          )
        ],
      ),
    );
  }

  Widget buildProfileHeader() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: .1),
            border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                authStore.user!.name!.substring(0, 1).toUpperCase(),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authStore.user!.fullName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    authStore.user!.email!,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
