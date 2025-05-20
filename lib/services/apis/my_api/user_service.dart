import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/user.dart';

class UserService {
  final Dio dio;

  UserService(this.dio);

  Future<User?> get() async => Future.value(
      User(name: "Test", surname: "Testoğlu", email: "test@test.com"));

  Future<User> signIn(Map<String, dynamic> userData) async => Future.value(User(
      name: "Test", surname: "Testoğlu", email: "test@test.com", token: ""));

  Future<User> update(Map<String, dynamic> data) async =>
      await Future.value(User(
          name: "Test",
          surname: "Testoğlu",
          email: "test@test.com",
          token: "",
          phoneNo: "901234567890"));
}
