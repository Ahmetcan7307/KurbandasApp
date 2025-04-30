import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kurbandas/services/apis/api/api.dart';

enum Controllers { users }

class MyAPI {
  static String getUrl(Controllers controllers, String action) {
    String url = (dotenv.env["apiUrl"])!;

    switch (controllers) {
      case Controllers.users:
        url += "AppUsers";
        break;
    }

    url += "/$action";

    return url;
  }

  static Exception getError(String url, Response? response) =>
      API.getError(url, response);

  static Exception getDioException(DioException e) => API.getDioException(e);
}
