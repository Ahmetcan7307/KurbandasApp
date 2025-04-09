import '../../core/domain/entities/user.dart';

class UserService {
  Future<User?> get({String? email = ""}) async {
    return User(name: "Test", surname: "Testoğlu", email: "test@test.com");
  }
}