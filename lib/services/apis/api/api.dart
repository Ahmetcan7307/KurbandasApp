import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/api_error.dart';

abstract class API {
  static Exception getError(Response? response) =>
      Exception("Response: $response");

  static throwDioException(DioException e) {
    Response response = e.response!;
    if (response.statusCode == 500) {
      throw ApiError.fromJson(response.data!);
    }

    throw getError(response);
  }
}
