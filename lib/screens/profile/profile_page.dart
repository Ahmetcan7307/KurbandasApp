import 'package:flutter/material.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late S lang;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);
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
      ),
    );
  }
}
