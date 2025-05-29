// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban_report.dart';
import 'package:kurbandas/core/utils/components/my_snackbar.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/stores/api/kurban_report_store.dart';
import 'package:kurbandas/stores/api/kurban_store.dart';
import 'package:kurbandas/stores/root_store.dart';
import 'package:provider/provider.dart';

class KurbanReportPage extends StatefulWidget {
  const KurbanReportPage({super.key});

  @override
  State<KurbanReportPage> createState() => _KurbanReportPageState();
}

class _KurbanReportPageState extends State<KurbanReportPage> {
  final TextEditingController whyCnt = TextEditingController();

  int? selectedQuickWhy;

  bool _isSubmitting = false, isLoading = true;

  late List<Map<String, dynamic>> reportCategories;

  late S lang;

  late KurbanStore kurbanStore;
  late KurbanReportStore kurbanReportStore;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      reportCategories = [
        {
          "id": 0,
          "title": lang.reportCategoryFraud,
          "icon": Icons.warning,
          "description": lang.reportCategoryFraudDescription
        },
        {
          "id": 1,
          "title": lang.reportCategoryInappropriateContent,
          "icon": Icons.block,
          "description": lang.reportCategoryInappropriateContentDescription
        },
        {
          "id": 2,
          "title": lang.reportCategoryFakePhotos,
          "icon": Icons.photo,
          "description": lang.reportCategoryFakePhotosDescription
        },
        {
          "id": 3,
          "title": lang.reportCategoryPriceManipulation,
          "icon": Icons.attach_money,
          "description": lang.reportCategoryPriceManipulationDescription
        },
        {
          "id": 4,
          "title": lang.reportCategoryAnimalWelfare,
          "icon": Icons.pets,
          "description": lang.reportCategoryAnimalWelfareDescription
        },
        {
          "id": 5,
          "title": lang.reportCategoryOther,
          "icon": Icons.more_horiz,
          "description": lang.reportCategoryOtherDescription
        },
      ];

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
    kurbanReportStore = rootStore.kurbanReportStore;
  }

  @override
  void dispose() {
    whyCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.reportTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (_isSubmitting)
            Center(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.report_problem,
                          color: Colors.red,
                          size: 32,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lang.reportKurbanAd,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                lang.reportDescription,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    lang.reportCategoryTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  if (isLoading)
                    Center(child: CircularProgressIndicator())
                  else
                    ...reportCategories.map((category) {
                      bool isSelected = selectedQuickWhy == category["id"];

                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                isSelected ? Colors.red : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                          color: isSelected ? Colors.red.shade50 : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: .1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16),
                          leading: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.red
                                  : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              category["icon"],
                              color:
                                  isSelected ? Colors.white : Colors.grey[600],
                              size: 24,
                            ),
                          ),
                          title: Text(
                            category["title"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.red : Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              category["description"],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ),
                          trailing: Radio<int>(
                            value: category["id"],
                            groupValue: selectedQuickWhy,
                            onChanged: (int? value) {
                              setState(() {
                                selectedQuickWhy = value;
                              });
                            },
                            activeColor: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              selectedQuickWhy = category["id"];
                            });
                          },
                        ),
                      );
                    }),
                  SizedBox(height: 24),
                  Text(
                    lang.detailedExplanation,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: .1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: whyCnt,
                      maxLines: 5,
                      maxLength: 500,
                      decoration: InputDecoration(
                        hintText: lang.detailedExplanationHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            lang.reportProcessingInfo,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: .2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isSubmitting
                        ? null
                        : () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(color: Colors.grey.shade400),
                    ),
                    child: Text(
                      lang.cancel,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitReport,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: _isSubmitting
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                lang.submitting,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            lang.reportSubmit,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitReport() async {
    setState(() {
      _isSubmitting = true;
    });

    try {
      await kurbanReportStore.create(
          kurbanStore.selectedKurbanDocumentId!,
          KurbanReport(
              why: whyCnt.text.isEmpty ? null : whyCnt.text,
              quickWhy: selectedQuickWhy));

      Navigator.of(context).pop();

      showSnackBar(context,
          text: lang.reportSubmittedSuccessfully, color: Colors.green);
    } catch (e) {
      showSnackBar(context, text: e.toString(), color: Colors.red);
    }

    if (mounted) {
      setState(() {
        _isSubmitting = false;
      });
    }
  }
}
