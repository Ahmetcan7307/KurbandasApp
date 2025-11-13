import 'package:kurbandas/core/domain/entities/kurban_report.dart';
import 'package:kurbandas/injector.dart';
import 'package:kurbandas/services/apis/my_api/kurban_report_service.dart';
import 'package:kurbandas/services/encrypt_service.dart';
import 'package:mobx/mobx.dart';

part 'kurban_report_store.g.dart';

class KurbanReportStore = _KurbanReportStore with _$KurbanReportStore;

abstract class _KurbanReportStore with Store {
  KurbanReportService service = serviceLocator.get<KurbanReportService>();
  EncryptService encryptService = serviceLocator.get<EncryptService>();

  Future create(String kurbanDocumentId, KurbanReport report) async =>
      await service.create(
          kurbanDocumentId, await encryptService.encryptMap(report.toJson()));
}
