import 'package:dio/dio.dart';
import 'package:kurbandas/services/apis/api/query.dart';
import 'package:kurbandas/services/apis/google_apis/google_api.dart';

class GoogleApiService {
  final Dio dio;

  GoogleApiService(this.dio);

  Future<String?> getPhoneNumber(String accessToken) async {
    try {
      String url = GoogleApi.getUrl(Controllers.me,
          queries: [Query(name: "personFields", value: "phoneNumbers")]);
      dio.options.headers["Authorization"] = "Bearer $accessToken";

      Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(url);

      if (response.statusCode == 200) {
        if (response.data!.containsKey("phoneNumbers") &&
            response.data!["phoneNumbers"] is List &&
            response.data!["phoneNumbers"].isNotEmpty) {
          return response.data!["phoneNumbers"][0]["canonicalForm"];
        }

        return null;
      }

      throw GoogleApi.getError(url, response);
    } on DioException catch (e) {
      throw GoogleApi.getDioException(e);
    }
  }
}
