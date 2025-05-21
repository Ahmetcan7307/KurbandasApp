// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??=
          Computed<bool>(() => super.isLoggedIn, name: '_AuthStore.isLoggedIn'))
      .value;

  late final _$userAtom = Atom(name: '_AuthStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$currentUserAsyncAction =
      AsyncAction('_AuthStore.currentUser', context: context);

  @override
  Future<dynamic> currentUser() {
    return _$currentUserAsyncAction.run(() => super.currentUser());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthStore.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthStore.signInWithGoogle', context: context);

  @override
  Future<dynamic> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  late final _$signInWithAppleAsyncAction =
      AsyncAction('_AuthStore.signInWithApple', context: context);

  @override
  Future<dynamic> signInWithApple() {
    return _$signInWithAppleAsyncAction.run(() => super.signInWithApple());
  }

  late final _$updatePhoneNoAsyncAction =
      AsyncAction('_AuthStore.updatePhoneNo', context: context);

  @override
  Future<dynamic> updatePhoneNo(String phoneNo) {
    return _$updatePhoneNoAsyncAction.run(() => super.updatePhoneNo(phoneNo));
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
