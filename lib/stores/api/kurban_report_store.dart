import 'package:kurbandas/core/domain/entities/kurban_report.dart';
import 'package:mobx/mobx.dart';

part 'kurban_report_store.g.dart';

class KurbanReportStore = _KurbanReportStore with _$KurbanReportStore;

abstract class _KurbanReportStore with Store {
  void create(String kurbanDocumentId, KurbanReport report) async {
    return;
  }
}
