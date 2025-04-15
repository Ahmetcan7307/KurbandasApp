import 'package:hive/hive.dart';
import 'package:kurbandas/core/const/hive_cons.dart';
import 'package:mobx/mobx.dart';

import '../../core/domain/entities/user.dart';
import '../../injector.dart';
import '../../services/api/user_service.dart';
import '../../services/supabase/auth_service.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  User? user;

  final AuthService authService = serviceLocator.get<AuthService>();
  final UserService userService = serviceLocator.get<UserService>();

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
      User dbUser = await userService.signIn(authUser.toJson());
      user = dbUser;
      await Hive.box<String>(HiveCons.settings)
          .put(HiveCons.token, user!.token!);
    }
  }
}
