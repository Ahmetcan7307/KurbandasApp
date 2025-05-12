import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/user.dart';

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

  Future<User> update(Map<String, dynamic> data) async =>
      await Future.value(User(
          name: "Ahmet",
          surname: "Balaman",
          email: "ahmet@test.com",
          token: "",
          phoneNo: "901234567890"));
}
