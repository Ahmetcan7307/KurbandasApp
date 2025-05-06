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

  /// `Share Qurbani`
  String get shareQurbani {
    return Intl.message(
      'Share Qurbani',
      name: 'shareQurbani',
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

  /// `No Cut Date`
  String get noCutDate {
    return Intl.message(
      'No Cut Date',
      name: 'noCutDate',
      desc: '',
      args: [],
    );
  }

  /// `Partnership Requests`
  String get partnershipRequests {
    return Intl.message(
      'Partnership Requests',
      name: 'partnershipRequests',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get waiting {
    return Intl.message(
      'Waiting',
      name: 'waiting',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get approved {
    return Intl.message(
      'Approved',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `There is not any Waiting Requests`
  String get noWaitingRequests {
    return Intl.message(
      'There is not any Waiting Requests',
      name: 'noWaitingRequests',
      desc: '',
      args: [],
    );
  }

  /// `There is not any Approved Requests`
  String get noApprovedRequests {
    return Intl.message(
      'There is not any Approved Requests',
      name: 'noApprovedRequests',
      desc: '',
      args: [],
    );
  }

  /// `Request Date`
  String get requestDate {
    return Intl.message(
      'Request Date',
      name: 'requestDate',
      desc: '',
      args: [],
    );
  }

  /// `Approve`
  String get approve {
    return Intl.message(
      'Approve',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `Approve Request`
  String get approveRequest {
    return Intl.message(
      'Approve Request',
      name: 'approveRequest',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to approve {name}'s request for partnership?`
  String areYouSureApproveRequest(String name) {
    return Intl.message(
      'Are you sure you want to approve $name\'s request for partnership?',
      name: 'areYouSureApproveRequest',
      desc: '',
      args: [name],
    );
  }

  /// `{name}'s request approved`
  String requestApproved(String name) {
    return Intl.message(
      '$name\'s request approved',
      name: 'requestApproved',
      desc: '',
      args: [name],
    );
  }

  /// `Decline Request`
  String get declineRequest {
    return Intl.message(
      'Decline Request',
      name: 'declineRequest',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to approve {name}'s request for partnership?`
  String areYouSureDeclineRequest(String name) {
    return Intl.message(
      'Are you sure you want to approve $name\'s request for partnership?',
      name: 'areYouSureDeclineRequest',
      desc: '',
      args: [name],
    );
  }

  /// `{name}'s request approved`
  String requestDeclined(String name) {
    return Intl.message(
      '$name\'s request approved',
      name: 'requestDeclined',
      desc: '',
      args: [name],
    );
  }

  /// `There is no Qurbani you have participated in yet`
  String get noPartnerships {
    return Intl.message(
      'There is no Qurbani you have participated in yet',
      name: 'noPartnerships',
      desc: '',
      args: [],
    );
  }

  /// `You can browse the Qurbani announcements on the homepage and become a partner`
  String get noPartnershipsDesc {
    return Intl.message(
      'You can browse the Qurbani announcements on the homepage and become a partner',
      name: 'noPartnershipsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Cut`
  String get cut {
    return Intl.message(
      'Cut',
      name: 'cut',
      desc: '',
      args: [],
    );
  }

  /// `Shared`
  String get shared {
    return Intl.message(
      'Shared',
      name: 'shared',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Actives`
  String get active {
    return Intl.message(
      'Actives',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `No Qurbanis were found`
  String get NoQurbani {
    return Intl.message(
      'No Qurbanis were found',
      name: 'NoQurbani',
      desc: '',
      args: [],
    );
  }

  /// `You can try different filters`
  String get differentFilters {
    return Intl.message(
      'You can try different filters',
      name: 'differentFilters',
      desc: '',
      args: [],
    );
  }

  /// `Click on the “New Qurbani” button to share the Qurbani`
  String get NoQurbaniDesc {
    return Intl.message(
      'Click on the “New Qurbani” button to share the Qurbani',
      name: 'NoQurbaniDesc',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Cut Date`
  String get cutDate {
    return Intl.message(
      'Cut Date',
      name: 'cutDate',
      desc: '',
      args: [],
    );
  }

  /// `Partnership State`
  String get partnershipState {
    return Intl.message(
      'Partnership State',
      name: 'partnershipState',
      desc: '',
      args: [],
    );
  }

  /// `Count`
  String get count {
    return Intl.message(
      'Count',
      name: 'count',
      desc: '',
      args: [],
    );
  }

  /// `Remain`
  String get remain {
    return Intl.message(
      'Remain',
      name: 'remain',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Send Request To Become a Partner`
  String get sendRequest {
    return Intl.message(
      'Send Request To Become a Partner',
      name: 'sendRequest',
      desc: '',
      args: [],
    );
  }

  /// `Partner`
  String get partner {
    return Intl.message(
      'Partner',
      name: 'partner',
      desc: '',
      args: [],
    );
  }

  /// `Partnership Date`
  String get partnershipDate {
    return Intl.message(
      'Partnership Date',
      name: 'partnershipDate',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Successfully sent request`
  String get SuccessfullySentRequest {
    return Intl.message(
      'Successfully sent request',
      name: 'SuccessfullySentRequest',
      desc: '',
      args: [],
    );
  }

  /// `Qurbani Information`
  String get QurbaniInfo {
    return Intl.message(
      'Qurbani Information',
      name: 'QurbaniInfo',
      desc: '',
      args: [],
    );
  }

  /// `Location Information`
  String get LocationInfo {
    return Intl.message(
      'Location Information',
      name: 'LocationInfo',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get Preview {
    return Intl.message(
      'Preview',
      name: 'Preview',
      desc: '',
      args: [],
    );
  }

  /// `Qurbani was successfully shared`
  String get successfullyShared {
    return Intl.message(
      'Qurbani was successfully shared',
      name: 'successfullyShared',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all required information`
  String get fillRequiredInfo {
    return Intl.message(
      'Please fill in all required information',
      name: 'fillRequiredInfo',
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
