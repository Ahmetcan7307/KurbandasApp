import 'package:kurbandas/core/domain/entities/user.dart' as user_c;
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final GoTrueClient _supabaseAuth = Supabase.instance.client.auth;

  Future<user_c.User?> currentUser() async {
    User? user = _supabaseAuth.currentUser;
    if (user != null) {
      return user_c.User(email: user.email!);
    }

    return null;
  }

  Future<bool> logout() async {
    await _supabaseAuth.signOut();
    return true;
  }
}
