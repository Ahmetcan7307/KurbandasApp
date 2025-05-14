// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban_request.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/core/utils/extensions/date_time_extensions.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:kurbandas/stores/url_launcher_store.dart';
import 'package:provider/provider.dart';

class KurbanRequestsPage extends StatefulWidget {
  const KurbanRequestsPage({super.key});

  @override
  State<KurbanRequestsPage> createState() => _KurbanRequestsPageState();
}

class _KurbanRequestsPageState extends State<KurbanRequestsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  bool isLoading = true, isLoadingApprove = false;

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

    tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await kurbanStore.getRequests();

      setState(() {
        isLoading = false;
      });
    });
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
          title: Text(lang.partnershipRequests),
          bottom: TabBar(controller: tabController, tabs: [
            Tab(
              text: lang.waiting,
            ),
            Tab(
              text: lang.approved,
            )
          ]),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : TabBarView(controller: tabController, children: [
                buildRequestList(
                    kurbanStore.requests!
                        .where((KurbanRequest kurbanRequest) =>
                            kurbanRequest.state == KurbanRequestState.waiting)
                        .toList(),
                    isPending: true),
                buildRequestList(
                    kurbanStore.requests!
                        .where((KurbanRequest kurbanRequest) =>
                            kurbanRequest.state == KurbanRequestState.approved)
                        .toList(),
                    isPending: false)
              ]));
  }

  Widget buildRequestList(List<KurbanRequest> requests,
          {required bool isPending}) =>
      requests.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      isPending ? Icons.hourglass_empty : Icons.people_outline),
                  const SizedBox(height: 16),
                  Text(
                    isPending
                        ? lang.noWaitingRequests
                        : lang.noApprovedRequests,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: requests.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) =>
                  buildUserCard(isPending, requests[index]));

  Widget buildUserCard(bool isPending, KurbanRequest request) => Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    Theme.of(context).primaryColor.withValues(alpha: .8),
                child: Text(
                  request.user.name![0].toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.user.fullName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      request.user.email!,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${isPending ? lang.requestDate : lang.ApprovalDate}: ${request.createdAt != null ? request.createdAt!.formatDate() : request.updatedAt!.formatDate()}",
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 12),
                    )
                  ],
                ),
              ),
              if (isPending)
                isLoadingApprove
                    ? Center(child: CircularProgressIndicator())
                    : Row(
                        children: [
                          IconButton(
                            onPressed: () => approveOrDecline(
                                request.user.fullName,
                                true,
                                request.documentId!),
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            tooltip: lang.approve,
                          ),
                          IconButton(
                            onPressed: () => approveOrDecline(
                                request.user.fullName,
                                false,
                                request.documentId!),
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                            tooltip: lang.decline,
                          )
                        ],
                      ),
              IconButton(
                onPressed: () =>
                    isLoadingApprove ? null : call(request.user.phoneNo!),
                icon: Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
                tooltip: lang.call,
              )
            ],
          ),
        ),
      );

  Future approveOrDecline(
      String userName, bool isApprove, String documentId) async {
    if (await showDialog<bool>(
            context: context,
            builder: (context) =>
                buildAreYouSureApproveOrDeclineAlertDialog(userName, isApprove))
        as bool) {
      setState(() {
        isLoadingApprove = true;
      });
      await kurbanStore.approveOrDeclineRequest(documentId, isApprove);

      showSnackBar(context,
          text: isApprove
              ? lang.requestApproved(userName)
              : lang.requestDeclined(userName));

      setState(() {
        isLoadingApprove = false;
      });
    }
  }

  Widget buildAreYouSureApproveOrDeclineAlertDialog(
          String userName, bool isApprove) =>
      AlertDialog(
        title: Text(isApprove ? lang.approveRequest : lang.declineRequest),
        content: Text(isApprove
            ? lang.areYouSureApproveRequest(userName)
            : lang.areYouSureDeclineRequest(userName)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(lang.cancel)),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(isApprove ? lang.approve : lang.decline))
        ],
      );

  Future call(String phoneNo) async =>
      await urlLauncherStore.launchTel(phoneNo);
}
