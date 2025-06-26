import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/user.dart';

import 'my_api.dart';

class UserService {
  final Dio dio;

  UserService(this.dio);

  Future<User?> get() async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.get(MyAPI.getUrl(Controllers.users, "Get"));

      if (response.statusCode == 200) {
        return User.fromJson(response.data!);
      }

      throw MyAPI.getError(response);
    } on DioException catch (e) {
      Response response = e.response!;
      if (response.statusCode == 500) {
        return null;
      }

      throw MyAPI.getError(response);
    }
  }

  Future<User> signIn(Map<String, dynamic> userData) async {
    try {
      Response<Map<String, dynamic>> response = await dio
          .post<Map<String, dynamic>>(MyAPI.getUrl(Controllers.users, "SignIn"),
              data: userData);

      if (response.statusCode == 200) {
        return User.fromJson(response.data!);
      }

      throw MyAPI.getError(response);
    } on DioException catch (e) {
      throw MyAPI.throwDioException(e);
    }
  }

  Future<User> update(Map<String, dynamic> data) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.put(MyAPI.getUrl(Controllers.users, "Update"), data: data);

      if (response.statusCode == 200) {
        return User.fromJson(response.data!);
      }

      throw MyAPI.getError(response);
    } on DioException catch (e) {
      throw MyAPI.throwDioException(e);
    }
  }

  Future<bool> delete() async {
    Response response =
        await dio.delete(MyAPI.getUrl(Controllers.users, "Delete"));

    if (response.statusCode == 200) {
      return true;
    }

    throw MyAPI.getError(response);
  }
}
