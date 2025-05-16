import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/user.dart';
import 'package:kurbandas/services/apis/my_api/my_api.dart';

class UserService {
  final Dio dio;

  UserService(this.dio);

  Future<User?> get() async {
    return Future.value(
        User(name: "Ahmet", surname: "Balaman", email: "ahmet@test.com"));
  }

  Future<User> signIn(Map<String, dynamic> userData) async {
    return Future.value(
        User(name: "Ahmet", surname: "Balaman", email: "ahmet@test.com"));
  }

  Future<User> update(Map<String, dynamic> data) async {
    String url = MyAPI.getUrl(Controllers.users, "Update");
    Response<Map<String, dynamic>> response = await dio.put(url, data: data);

    if (response.statusCode == 200) {
      return User.fromJson(response.data!);
    }

    throw MyAPI.getError(url, response);
  }
}
