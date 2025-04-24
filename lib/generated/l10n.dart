// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `App Update Required`
  String get appUpdateRequired {
    return Intl.message(
      'App Update Required',
      name: 'appUpdateRequired',
      desc: 'Title for app update dialog',
      args: [],
    );
  }

  /// `Please update to continue using the app.`
  String get pleaseUpdateToContinue {
    return Intl.message(
      'Please update to continue using the app.',
      name: 'pleaseUpdateToContinue',
      desc: 'Message in app update dialog',
      args: [],
    );
  }

  /// `Update Now`
  String get updateNow {
    return Intl.message(
      'Update Now',
      name: 'updateNow',
      desc: 'Button text to update the app now',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: 'Button text to update the app later',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get SigninwithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'SigninwithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logoutConfirmation {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Signing out...`
  String get SigningOut {
    return Intl.message(
      'Signing out...',
      name: 'SigningOut',
      desc: '',
      args: [],
    );
  }

  /// `Easily find your partners for Qurbani`
  String get findPartnersQurbani {
    return Intl.message(
      'Easily find your partners for Qurbani',
      name: 'findPartnersQurbani',
      desc: '',
      args: [],
    );
  }

  /// `Partners`
  String get partners {
    return Intl.message(
      'Partners',
      name: 'partners',
      desc: '',
      args: [],
    );
  }

  /// `New Qurbani`
  String get newQurbani {
    return Intl.message(
      'New Qurbani',
      name: 'newQurbani',
      desc: '',
      args: [],
    );
  }

  /// `Filter Qurbani`
  String get FilterQurbani {
    return Intl.message(
      'Filter Qurbani',
      name: 'FilterQurbani',
      desc: '',
      args: [],
    );
  }

  /// `Qurbani Animal`
  String get QurbaniAnimal {
    return Intl.message(
      'Qurbani Animal',
      name: 'QurbaniAnimal',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Select Province`
  String get SelectProvince {
    return Intl.message(
      'Select Province',
      name: 'SelectProvince',
      desc: '',
      args: [],
    );
  }

  /// `Select District`
  String get SelectDistrict {
    return Intl.message(
      'Select District',
      name: 'SelectDistrict',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get MyProfile {
    return Intl.message(
      'My Profile',
      name: 'MyProfile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Profile Details`
  String get ProfileDetails {
    return Intl.message(
      'Profile Details',
      name: 'ProfileDetails',
      desc: '',
      args: [],
    );
  }

  /// `Application`
  String get app {
    return Intl.message(
      'Application',
      name: 'app',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get info {
    return Intl.message(
      'Information',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Help and Support`
  String get help {
    return Intl.message(
      'Help and Support',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Account Operations`
  String get AccountOperations {
    return Intl.message(
      'Account Operations',
      name: 'AccountOperations',
      desc: '',
      args: [],
    );
  }

  /// `My Qurbanies`
  String get myQurbanies {
    return Intl.message(
      'My Qurbanies',
      name: 'myQurbanies',
      desc: '',
      args: [],
    );
  }

  /// `My Partnerships`
  String get MyPartnerships {
    return Intl.message(
      'My Partnerships',
      name: 'MyPartnerships',
      desc: '',
      args: [],
    );
  }

  /// `You do not have any sacrifice announcements yet`
  String get noMyQurbaniAds {
    return Intl.message(
      'You do not have any sacrifice announcements yet',
      name: 'noMyQurbaniAds',
      desc: '',
      args: [],
    );
  }

  /// `You can use the “Share Qurbani” button on the home page to share your Qurbani`
  String get noMyQurbaniAdsDesc {
    return Intl.message(
      'You can use the “Share Qurbani” button on the home page to share your Qurbani',
      name: 'noMyQurbaniAdsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get Requests {
    return Intl.message(
      'Requests',
      name: 'Requests',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete Qurbani Posting`
  String get deleteQurbani {
    return Intl.message(
      'Delete Qurbani Posting',
      name: 'deleteQurbani',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the {animal} Qurbani?`
  String areYouSureDeleteQurbani(String animal) {
    return Intl.message(
      'Are you sure you want to delete the $animal Qurbani?',
      name: 'areYouSureDeleteQurbani',
      desc: '',
      args: [animal],
    );
  }

  /// `This action is irreversible and all partnerships are canceled.`
  String get areYouSureDeleteQurbaniDesc {
    return Intl.message(
      'This action is irreversible and all partnerships are canceled.',
      name: 'areYouSureDeleteQurbaniDesc',
      desc: '',
      args: [],
    );
  }

  /// `Qurbani announcement deleted`
  String get QurbaniPostDeleted {
    return Intl.message(
      'Qurbani announcement deleted',
      name: 'QurbaniPostDeleted',
      desc: '',
      args: [],
    );
  }

  /// `{count} partners remain`
  String partnersRemain(int count) {
    return Intl.message(
      '$count partners remain',
      name: 'partnersRemain',
      desc: '',
      args: [count],
    );
  }

  /// `Partnerships completed`
  String get PartnershipsCompleted {
    return Intl.message(
      'Partnerships completed',
      name: 'PartnershipsCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Cut Address`
  String get cutAddress {
    return Intl.message(
      'Cut Address',
      name: 'cutAddress',
      desc: '',
      args: [],
    );
  }

  /// `No Cut Address`
  String get noCutAddress {
    return Intl.message(
      'No Cut Address',
      name: 'noCutAddress',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
