import 'package:dio/dio.dart';
import 'package:kurbandas/services/apis/my_api/my_api.dart';

class KurbanReportService {
  final Dio dio;

  KurbanReportService(this.dio);

  Future create(String kurbanDocumentId, Map<String, dynamic> data) async {
    Response response = await dio.post(
        MyAPI.getUrl(Controllers.kurbanReports, "Create/$kurbanDocumentId"),
        data: data);

    if (response.statusCode == 200) {
      return;
    }

    throw MyAPI.getError(response);
  }
}
