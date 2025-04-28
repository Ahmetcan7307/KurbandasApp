import 'package:dio/dio.dart';

import '../core/domain/entities/api_error.dart';

abstract class API {
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
