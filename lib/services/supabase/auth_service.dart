import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kurbandas/core/domain/entities/user.dart' as user_c;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
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
          accessToken: googleAuth.accessToken!,
          idToken: googleAuth.idToken!);
    }

    return null;
  }

  Future<user_c.User?> signInWithApple() async {
    String rawNonce = _supabaseAuth.generateRawNonce();

    AuthorizationCredentialAppleID appleIDCredential =
        await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName
    ], nonce: sha256.convert(utf8.encode(rawNonce)).toString());
    String? idToken = appleIDCredential.identityToken;

    if (idToken == null) {
      throw const AuthException(
          "Could not find ID Token from generated credential.");
    }

    User? user = (await _supabaseAuth.signInWithIdToken(
            provider: OAuthProvider.apple, idToken: idToken, nonce: rawNonce))
        .user;
    if (user != null) {
      return user_c.User.fromApple(
          displayName:
              "${appleIDCredential.givenName} ${appleIDCredential.familyName}",
          email: user.email!);
    }

    return null;
  }
}
