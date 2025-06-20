import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/user.dart';

import 'my_api.dart';

class UserService {
  final Dio dio;

  UserService(this.dio);

  Future<User?> get() async {
    try {
      String url = MyAPI.getUrl(Controllers.users, "Get");
      Response<Map<String, dynamic>> response = await dio.get(url);

      if (response.statusCode == 200) {
        return User.fromJson(response.data!);
      }

      throw MyAPI.getError(url, response);
    } on DioException catch (e) {
      Response response = e.response!;
      if (response.statusCode == 500) {
        return null;
      }

      throw MyAPI.getError(response.realUri.toString(), response);
    }
  }

  Future<User> signIn(Map<String, dynamic> userData) async {
    try {
      String url = MyAPI.getUrl(Controllers.users, "SignIn");
      Response<Map<String, dynamic>> response =
          await dio.post<Map<String, dynamic>>(url, data: userData);

      if (response.statusCode == 200) {
        return User.fromJson(response.data!);
      }

      throw MyAPI.getError(url, response);
    } on DioException catch (e) {
      throw MyAPI.getDioException(e);
    }
  }

  Future<User> update(Map<String, dynamic> data) async {
    String url = MyAPI.getUrl(Controllers.users, "Update");
    try {
      Response<Map<String, dynamic>> response = await dio.put(url, data: data);

      if (response.statusCode == 200) {
        return User.fromJson(response.data!);
      }

      throw MyAPI.getError(url, response);
    } on DioException catch (e) {
      throw MyAPI.getDioException(e);
    }
  }

  Future<bool> delete() async {
    String url = MyAPI.getUrl(Controllers.users, "Delete");
    Response response = await dio.delete(url);

    if (response.statusCode == 200) {
      return true;
    }

    throw MyAPI.getError(url, response);
  }
}
