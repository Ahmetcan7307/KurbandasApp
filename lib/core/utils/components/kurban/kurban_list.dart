import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_card.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_shimmer.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/routes.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

class KurbanList extends StatefulWidget {
  final bool? isActive;

  const KurbanList({super.key, this.isActive});

  @override
  State<KurbanList> createState() => _KurbanListState();
}

class _KurbanListState extends State<KurbanList> {
  late KurbanStore kurbanStore;

  ScrollController controller = ScrollController();

  bool isLoading = false, hasMore = true;

  int page = 1;

  late S lang;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadPage();
    });

    setupController();
  }

  Future loadPage([int? pageNumber]) async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    int lastPage = pageNumber ?? page;
    bool isLastPage = await fetchKurbans(page);

    if (mounted) {
      setState(() {
        hasMore = !isLastPage;
        page = lastPage;
        isLoading = false;
      });
    }
  }

  Future<bool> fetchKurbans(int page) async => widget.isActive == null
      ? await kurbanStore.getAllKurbans(page)
      : widget.isActive == true
          ? await kurbanStore.getActiveKurbans(page)
          : await kurbanStore.getDeactiveKurbans(page);

  setupController() {
    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 200 &&
          hasMore &&
          !isLoading) {
        loadPage(page + 1);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    kurbanStore = Provider.of<RootStore>(context).kurbanStore;

    lang = S.of(context);
  }

  @override
  void didUpdateWidget(covariant KurbanList oldWidget) {
    super.didUpdateWidget(oldWidget);

    loadPage();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return buildLoadingView();

    if (kurbanStore.getKurbansLength(widget.isActive) == 0) {
      return buildEmptyView();
    }

    return RefreshIndicator(
      onRefresh: () async {
        await fetchKurbans(1);

        resetPagination();
      },
      child: Observer(builder: (context) {
        return ListView.builder(
            controller: controller,
            padding: const EdgeInsets.all(16),
            itemCount: kurbanStore.getKurbansLength(widget.isActive) +
                (hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == kurbanStore.getKurbansLength(widget.isActive)) {
                return buildLoadingMoreIndicator();
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: KurbanCard(
                  kurban: widget.isActive == null
                      ? kurbanStore.allKurbans.elementAt(index)
                      : widget.isActive == true
                          ? kurbanStore.activeKurbans.elementAt(index)
                          : kurbanStore.deactiveKurbans.elementAt(index),
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.kurbanDetail),
                ),
              );
            });
      }),
    );
  }

  Widget buildLoadingView() => ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: KurbanShimmer(),
        );
      });

  Widget buildEmptyView() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              lang.NoQurbani,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            if (kurbanStore.filter != null)
              Text(
                lang.differentFilters,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              )
            else
              Text(
                lang.NoQurbaniDesc,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              )
          ],
        ),
      );

  Widget buildLoadingMoreIndicator() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      );

  resetPagination() {
    setState(() {
      hasMore = true;
      page = 1;
      isLoading = false;
    });
  }
}
