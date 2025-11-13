import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kurbandas/services/apis/google_apis/google_api_service.dart';
import 'package:kurbandas/services/apis/my_api/user_service.dart';
import 'package:kurbandas/services/encrypt_service.dart';
import 'package:mobx/mobx.dart';

import '../../core/const/hive_cons.dart';
import '../../core/domain/entities/user.dart';
import '../../core/utils/components/dialogs/phone_number_dialog.dart';
import '../../injector.dart';
import '../../services/supabase/auth_service.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  User? user;

  final AuthService authService = serviceLocator.get<AuthService>();
  final UserService userService = serviceLocator.get<UserService>();
  final GoogleApiService googleApiService =
      serviceLocator.get<GoogleApiService>();
  final EncryptService encryptService = serviceLocator.get<EncryptService>();

  @computed
  bool get isLoggedIn => user != null;

  @action
  Future currentUser() async {
    User? authUser = await authService.currentUser();
    if (authUser != null) {
      user = await userService.get();
    }
  }

  @action
  Future logout() async {
    if (await authService.logout()) {
      user = null;
    }
  }

  @action
  Future signInWithGoogle() async {
    User? authUser = await authService.signInWithGoogle();
    if (authUser != null) {
      authUser.phoneNo =
          await googleApiService.getPhoneNumber(authUser.accessToken!);
      if (authUser.phoneNo != null &&
          authUser.phoneNo!.substring(0, 1) == "+") {
        authUser.phoneNo = authUser.phoneNo!.substring(1);
      }
      User dbUser = await userService
          .signIn(await encryptService.encryptMap(authUser.toJson()));
      user = dbUser;

      await updateHiveToken();
    }
  }

  Future updateHiveToken() async => await Hive.box<String>(HiveCons.settings)
      .put(HiveCons.token, user!.token!);

  @action
  Future signInWithApple() async {
    User? authUser = await authService.signInWithApple();
    if (authUser != null) {
      user = await userService
          .signIn(await encryptService.encryptMap(authUser.toJson()));

      await updateHiveToken();
    }
  }

  @action
  Future updatePhoneNo(String phoneNo) async => user = await userService
      .update(await encryptService.encryptMap({"phoneNo": phoneNo}));

  Future<bool> checkPhoneNo(BuildContext context) async {
    if (user!.phoneNo == null) {
      return (await showDialog<bool?>(
              context: context, builder: (context) => PhoneNumberDialog())) ??
          false;
    }
    return true;
  }

  @action
  Future delete() async {
    if (await userService.delete()) {
      await logout();
    }
  }
}
