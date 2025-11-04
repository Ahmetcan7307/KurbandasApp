import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_card.dart';
import 'package:kurbandas/core/utils/components/kurban/kurban_shimmer.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

class KurbanList extends StatefulWidget {
  final bool isActive;

  const KurbanList({super.key, required this.isActive});

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

    int currentPage = pageNumber ?? page;
    bool isLastPage = await fetchKurbans(page);

    if (mounted) {
      setState(() {
        hasMore = !isLastPage;
        page = currentPage;
        isLoading = false;
      });
    }
  }

  Future<bool> fetchKurbans(int page) async => widget.isActive
      ? await kurbanStore.getActiveKurbans(page)
      : await kurbanStore.getDeactiveKurbans(page);

  void setupController() {
    controller.addListener(() {
      if (controller.position.pixels >=
              (controller.position.maxScrollExtent - 200) &&
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
    if (isLoading && kurbanStore.getKurbansLength(widget.isActive) == 0) {
      return buildLoadingView();
    }

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
            physics: const AlwaysScrollableScrollPhysics(),
            controller: controller,
            padding: const EdgeInsets.all(16),
            itemCount: kurbanStore.getKurbansLength(widget.isActive),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: KurbanCard(
                  kurban: widget.isActive
                      ? kurbanStore.activeKurbans.elementAt(index)
                      : kurbanStore.deactiveKurbans.elementAt(index),
                  onTap: () =>
                      kurbanStore.selectKurban(false, widget.isActive, index),
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

  void resetPagination() {
    setState(() {
      hasMore = true;
      page = 1;
      isLoading = false;
    });
  }
}
