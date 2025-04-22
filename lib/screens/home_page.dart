import 'package:flutter/material.dart';
import 'package:kurbandas/core/utils/components/filter_bottom_sheet.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_list.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late S lang;

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
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
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).primaryColor.withValues(alpha: .1),
            child: Row(children: [
              const Icon(
                Icons.info_outline,
                color: Colors.green,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  lang.findPartnersQurbani,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ]),
          ),
          Expanded(child: const KurbanList())
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => (),
        icon: const Icon(Icons.add),
        label: Text(lang.newQurbani),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Future showFilterBottomSheet() async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => FilterBottomSheet());
  }
}
