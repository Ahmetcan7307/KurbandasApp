import 'package:dio/dio.dart';
import 'package:kurbandas/services/api/api.dart';

import '../../core/domain/entities/user.dart';

class UserService {
  final Dio dio;

  UserService(this.dio);

  Future<User?> get({String? email = ""}) async {
    return User(
        name: "Test",
        surname: "Testoğlu",
        email: "test@test.com",
        phoneNo: "5551234567890");
  }

  Future<User> signIn(Map<String, dynamic> userData) async {
    try {
      String url = API.getUrl(Controllers.users, "SignIn");
      Response<Map<String, dynamic>> response =
          await dio.post<Map<String, dynamic>>(url, data: userData);

      if (response.statusCode == 200) {
        return User.fromJson(response.data!);
      }

      throw API.getError(url, response);
    } on DioException catch (e) {
      throw API.getDioException(e);
    }
  }
}
