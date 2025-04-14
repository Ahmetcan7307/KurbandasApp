import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/domain/entities/api_error.dart';

enum Controllers { users }

class API {
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
      Exception("Url: $url Response: $response");

  static Exception getDioException(DioException e) {
    Response response = e.response!;
    if (response.statusCode == 500) {
      throw ApiError.fromJson(response.data!);
    }

    throw getError(response.realUri.toString(), response);
  }
}
