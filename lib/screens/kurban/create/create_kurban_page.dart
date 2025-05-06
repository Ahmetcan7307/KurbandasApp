// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/screens/kurban/create/create_kurban_basic_info_page.dart';
import 'package:kurbandas/screens/kurban/create/create_kurban_location_page.dart';
import 'package:kurbandas/screens/kurban/create/create_kurban_preview_page.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

class CreateKurbanPage extends StatefulWidget {
  const CreateKurbanPage({super.key});

  @override
  State<CreateKurbanPage> createState() => _CreateKurbanPageState();
}

// Todo cutDate, photos
class _CreateKurbanPageState extends State<CreateKurbanPage> {
  PageController controller = PageController();

  int currentPage = 0;

  List<String>? stepTitles;

  late S lang;

  late KurbanStore kurbanStore;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      stepTitles = [lang.QurbaniInfo, lang.LocationInfo, lang.Preview];

      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    lang = S.of(context);

    kurbanStore = Provider.of<RootStore>(context).kurbanStore;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.shareQurbani),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Stepper göstergesi
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).primaryColor.withValues(alpha: .1),
            child: stepTitles == null
                ? CircularProgressIndicator()
                : Row(
                    children: List.generate(
                        stepTitles!.length,
                        (index) => Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      if (index > 0)
                                        Expanded(
                                          child: Container(
                                            height: 2,
                                            color: index <= currentPage
                                                ? Theme.of(context).primaryColor
                                                : Colors.grey.shade300,
                                          ),
                                        ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: index <= currentPage
                                                ? Theme.of(context).primaryColor
                                                : Colors.grey.shade300),
                                        child: Center(
                                          child: Text(
                                            (index + 1).toString(),
                                            style: TextStyle(
                                                color: index <= currentPage
                                                    ? Colors.white
                                                    : Colors.grey.shade700,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      if (index < stepTitles!.length - 1)
                                        Expanded(
                                          child: Container(
                                            height: 2,
                                            color: index < currentPage
                                                ? Theme.of(context).primaryColor
                                                : Colors.grey.shade300,
                                          ),
                                        )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    stepTitles![index],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: index <= currentPage
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey.shade600,
                                        fontWeight: index == currentPage
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  )
                                ],
                              ),
                            ))),
          ),
          // Sayfalar
          Expanded(
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: onPageChanged,
              children: [
                CreateKurbanBasicInfoPage(onContinue: goToNextPage),
                CreateKurbanLocationPage(
                    onContinue: goToNextPage, onBack: goToPreviousPage),
                CreateKurbanPreviewPage(
                    onSubmit: submitKurban, onBack: goToPreviousPage)
              ],
            ),
          )
        ],
      ),
    );
  }

  goToNextPage() {
    if (currentPage < 2) {
      setState(() {
        currentPage++;
      });

      controller.animateToPage(currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  goToPreviousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });

      controller.animateToPage(currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  Future submitKurban() async {
    if (kurbanStore.newKurban != null && kurbanStore.newKurban!.isComplete) {
      try {
        await kurbanStore.createKurban();

        showSnackBar(context,
            text: lang.successfullyShared, color: Colors.green);
      } catch (e) {
        showSnackBar(context, text: "${lang.error}: $e");
      }
    } else {
      showSnackBar(context, text: lang.fillRequiredInfo, color: Colors.red);
    }
  }
}
