import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future<user_c.User?> signInWithGoogle() async {
    GoogleSignInAccount? googleAccount = (await GoogleSignIn(
            scopes: [
          "email",
          "https://www.googleapis.com/auth/userinfo.profile",
          "https://www.googleapis.com/auth/user.phonenumbers.read"
        ],
            clientId: Platform.isIOS ? dotenv.env["clientId"] : null,
            serverClientId:
                Platform.isIOS ? dotenv.env["serverClientId"] : null)
        .signIn())!;
    GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

    if (googleAuth.accessToken == null) {
      throw "No Access Token found.";
    }
    if (googleAuth.idToken == null) {
      throw "No ID Token found.";
    }

    User? user = (await _supabaseAuth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: googleAuth.idToken!,
            accessToken: googleAuth.accessToken!))
        .user;
    if (user != null) {
      return user_c.User.fromGoogle(
          displayName: googleAccount.displayName!,
          email: user.email!,
          phoneNo: user.phone!.isNotEmpty ? user.phone : null);
    }

    return null;
  }
}
