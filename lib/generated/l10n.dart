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

  /// `Application`
  String get app {
    return Intl.message(
      'Application',
      name: 'app',
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

  /// `You do not have any Qurbani announcements yet`
  String get noMyQurbaniAds {
    return Intl.message(
      'You do not have any Qurbani announcements yet',
      name: 'noMyQurbaniAds',
      desc: '',
      args: [],
    );
  }

  /// `You can use the 'Share Qurbani' button on the home page to share your Qurbani`
  String get noMyQurbaniAdsDesc {
    return Intl.message(
      'You can use the \'Share Qurbani\' button on the home page to share your Qurbani',
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

  /// `Qurbani announcement removed`
  String get QurbaniPostDeleted {
    return Intl.message(
      'Qurbani announcement removed',
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

  /// `Click on the 'Share Qurbani' button to share the Qurbani`
  String get NoQurbaniDesc {
    return Intl.message(
      'Click on the \'Share Qurbani\' button to share the Qurbani',
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

  /// `Select cut date`
  String get selectCutDate {
    return Intl.message(
      'Select cut date',
      name: 'selectCutDate',
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

  /// `Select Qurbani animal`
  String get selectAnimal {
    return Intl.message(
      'Select Qurbani animal',
      name: 'selectAnimal',
      desc: '',
      args: [],
    );
  }

  /// `Please select Qurbani animal`
  String get pleaseSelectAnimal {
    return Intl.message(
      'Please select Qurbani animal',
      name: 'pleaseSelectAnimal',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Qurbani's weight`
  String get enterWeight {
    return Intl.message(
      'Enter the Qurbani\'s weight',
      name: 'enterWeight',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the Qurbani's weight`
  String get pleaseWeight {
    return Intl.message(
      'Please enter the Qurbani\'s weight',
      name: 'pleaseWeight',
      desc: '',
      args: [],
    );
  }

  /// `Enter the valid weight`
  String get validWeight {
    return Intl.message(
      'Enter the valid weight',
      name: 'validWeight',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Qurbani's price`
  String get enterPrice {
    return Intl.message(
      'Enter the Qurbani\'s price',
      name: 'enterPrice',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the Qurbani's price`
  String get pleasePrice {
    return Intl.message(
      'Please enter the Qurbani\'s price',
      name: 'pleasePrice',
      desc: '',
      args: [],
    );
  }

  /// `Enter the valid price`
  String get validPrice {
    return Intl.message(
      'Enter the valid price',
      name: 'validPrice',
      desc: '',
      args: [],
    );
  }

  /// `Total Partners count (max 7)`
  String get totalPartnersCountMax {
    return Intl.message(
      'Total Partners count (max 7)',
      name: 'totalPartnersCountMax',
      desc: '',
      args: [],
    );
  }

  /// `Enter the total partners count`
  String get enterTotalPartnersCount {
    return Intl.message(
      'Enter the total partners count',
      name: 'enterTotalPartnersCount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the total partners count`
  String get pleaseTotalPartnersCount {
    return Intl.message(
      'Please enter the total partners count',
      name: 'pleaseTotalPartnersCount',
      desc: '',
      args: [],
    );
  }

  /// `Enter the valid total partners count`
  String get validTotalPartnersCount {
    return Intl.message(
      'Enter the valid total partners count',
      name: 'validTotalPartnersCount',
      desc: '',
      args: [],
    );
  }

  /// `Maximum number of partners can be 7`
  String get MaximumPartners7 {
    return Intl.message(
      'Maximum number of partners can be 7',
      name: 'MaximumPartners7',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueTxt {
    return Intl.message(
      'Continue',
      name: 'continueTxt',
      desc: '',
      args: [],
    );
  }

  /// `Enter information about the place where your Qurbani will be slaughtered`
  String get EnterInfoPlace {
    return Intl.message(
      'Enter information about the place where your Qurbani will be slaughtered',
      name: 'EnterInfoPlace',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message(
      'Province',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `Please select province`
  String get pleaseProvince {
    return Intl.message(
      'Please select province',
      name: 'pleaseProvince',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message(
      'District',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Please select district`
  String get pleaseDistrict {
    return Intl.message(
      'Please select district',
      name: 'pleaseDistrict',
      desc: '',
      args: [],
    );
  }

  /// `Enter cut address`
  String get enterCutAddress {
    return Intl.message(
      'Enter cut address',
      name: 'enterCutAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter cut address`
  String get pleaseCutAddress {
    return Intl.message(
      'Please enter cut address',
      name: 'pleaseCutAddress',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Qurbani informations`
  String get confirmQurbaniInfo {
    return Intl.message(
      'Confirm Qurbani informations',
      name: 'confirmQurbaniInfo',
      desc: '',
      args: [],
    );
  }

  /// `Important Information`
  String get ImportantInfo {
    return Intl.message(
      'Important Information',
      name: 'ImportantInfo',
      desc: '',
      args: [],
    );
  }

  /// `One Qurbani can have a maximum of 7 partners.`
  String get ImportantInfoDesc {
    return Intl.message(
      'One Qurbani can have a maximum of 7 partners.',
      name: 'ImportantInfoDesc',
      desc: '',
      args: [],
    );
  }

  /// `Total Partners Count`
  String get totalPartnersCount {
    return Intl.message(
      'Total Partners Count',
      name: 'totalPartnersCount',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get photos {
    return Intl.message(
      'Photos',
      name: 'photos',
      desc: '',
      args: [],
    );
  }

  /// `Add photos`
  String get addPhotos {
    return Intl.message(
      'Add photos',
      name: 'addPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Use the buttons below to add photos (max 7)`
  String get UseButtonsAddPhotos {
    return Intl.message(
      'Use the buttons below to add photos (max 7)',
      name: 'UseButtonsAddPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Remaining photo count`
  String get remainingPhotoCount {
    return Intl.message(
      'Remaining photo count',
      name: 'remainingPhotoCount',
      desc: '',
      args: [],
    );
  }

  /// `You can add up to 7 photos`
  String get canAdd7Photos {
    return Intl.message(
      'You can add up to 7 photos',
      name: 'canAdd7Photos',
      desc: '',
      args: [],
    );
  }

  /// `Please attach at least 1 photo`
  String get pleasePhoto {
    return Intl.message(
      'Please attach at least 1 photo',
      name: 'pleasePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Edit Qurbani Information`
  String get editQurbaniInfo {
    return Intl.message(
      'Edit Qurbani Information',
      name: 'editQurbaniInfo',
      desc: '',
      args: [],
    );
  }

  /// `Existing Photos`
  String get ExistingPhotos {
    return Intl.message(
      'Existing Photos',
      name: 'ExistingPhotos',
      desc: '',
      args: [],
    );
  }

  /// `New Photos`
  String get newPhotos {
    return Intl.message(
      'New Photos',
      name: 'newPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Qurbani information successfully updated`
  String get QurbaniInfoSuccessfullyUpdated {
    return Intl.message(
      'Qurbani information successfully updated',
      name: 'QurbaniInfoSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get SaveChanges {
    return Intl.message(
      'Save Changes',
      name: 'SaveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get aboutApp {
    return Intl.message(
      'About App',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Kurbandaş application is a platform developed to find and share Qurbani partnerships during Eid al-Adha. Users can declare their own Qurbanis and become partners in other users' Qurbanis.`
  String get aboutAppDesc {
    return Intl.message(
      'Kurbandaş application is a platform developed to find and share Qurbani partnerships during Eid al-Adha. Users can declare their own Qurbanis and become partners in other users\' Qurbanis.',
      name: 'aboutAppDesc',
      desc: '',
      args: [],
    );
  }

  /// `How to Works?`
  String get howToWorks {
    return Intl.message(
      'How to Works?',
      name: 'howToWorks',
      desc: '',
      args: [],
    );
  }

  /// `From the home page, you can view and filter the available Qurbani ads and access the details of the ads. You can send a request for the Qurbani you want to be a partner. You can use the “Share Qurbani” button to share your own Qurbani. You can manage your own Qurbanis and partnerships from your profile.`
  String get howToWorksDesc {
    return Intl.message(
      'From the home page, you can view and filter the available Qurbani ads and access the details of the ads. You can send a request for the Qurbani you want to be a partner. You can use the “Share Qurbani” button to share your own Qurbani. You can manage your own Qurbanis and partnerships from your profile.',
      name: 'howToWorksDesc',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `For suggestions, complaints and questions`
  String get contactUsDesc {
    return Intl.message(
      'For suggestions, complaints and questions',
      name: 'contactUsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Frequently Asked Questions`
  String get sss {
    return Intl.message(
      'Frequently Asked Questions',
      name: 'sss',
      desc: '',
      args: [],
    );
  }

  /// `What is a Qurbani partnership?`
  String get WhatQurbaniPartnership {
    return Intl.message(
      'What is a Qurbani partnership?',
      name: 'WhatQurbaniPartnership',
      desc: '',
      args: [],
    );
  }

  /// `According to Islamic rules, bovine animals (cattle, calf, buffalo) can be sacrificed by a maximum of 7 people. Kurbandaş application mediates for people who want to Qurbani to find a partner or become a partner in an announced Qurbani.`
  String get WhatQurbaniPartnershipDesc {
    return Intl.message(
      'According to Islamic rules, bovine animals (cattle, calf, buffalo) can be sacrificed by a maximum of 7 people. Kurbandaş application mediates for people who want to Qurbani to find a partner or become a partner in an announced Qurbani.',
      name: 'WhatQurbaniPartnershipDesc',
      desc: '',
      args: [],
    );
  }

  /// `How do I become a partner?`
  String get HowBecomePartner {
    return Intl.message(
      'How do I become a partner?',
      name: 'HowBecomePartner',
      desc: '',
      args: [],
    );
  }

  /// `You can open the detail page by clicking on a Qurbani you want from the ads listed on the main page. You can send your request by clicking the “Send Partnership Request” button on the page. When the Qurbani owner approves your request, the partnership process is completed.`
  String get HowBecomePartnerDesc {
    return Intl.message(
      'You can open the detail page by clicking on a Qurbani you want from the ads listed on the main page. You can send your request by clicking the “Send Partnership Request” button on the page. When the Qurbani owner approves your request, the partnership process is completed.',
      name: 'HowBecomePartnerDesc',
      desc: '',
      args: [],
    );
  }

  /// `How can I find a partner for my Qurbani?`
  String get HowFindPartner {
    return Intl.message(
      'How can I find a partner for my Qurbani?',
      name: 'HowFindPartner',
      desc: '',
      args: [],
    );
  }

  /// `You can enter the details of your Qurbani by clicking the “Share Qurbani” button on the homepage. After your Qurbani announcement is published, users can send requests to become a partner with you. You can manage these requests from “My Profile > My Qurbanis” section.`
  String get HowFindPartnerDesc {
    return Intl.message(
      'You can enter the details of your Qurbani by clicking the “Share Qurbani” button on the homepage. After your Qurbani announcement is published, users can send requests to become a partner with you. You can manage these requests from “My Profile > My Qurbanis” section.',
      name: 'HowFindPartnerDesc',
      desc: '',
      args: [],
    );
  }

  /// `How do the Qurbani slaughter operations take place?`
  String get HowSlaughterOperationsTakePlace {
    return Intl.message(
      'How do the Qurbani slaughter operations take place?',
      name: 'HowSlaughterOperationsTakePlace',
      desc: '',
      args: [],
    );
  }

  /// `The app is only an intermediary platform for finding partners. Qurbani slaughter is organized by the owner of the Qurbani. The place and date of Qurbani are specified in the advertisement details.`
  String get HowSlaughterOperationsTakePlaceDesc {
    return Intl.message(
      'The app is only an intermediary platform for finding partners. Qurbani slaughter is organized by the owner of the Qurbani. The place and date of Qurbani are specified in the advertisement details.',
      name: 'HowSlaughterOperationsTakePlaceDesc',
      desc: '',
      args: [],
    );
  }

  /// `How are payments made?`
  String get HowPaymentsMade {
    return Intl.message(
      'How are payments made?',
      name: 'HowPaymentsMade',
      desc: '',
      args: [],
    );
  }

  /// `No payment is received or made through the app. Payment of the Qurbani price is made between the owner and the partners independently of the app.`
  String get HowPaymentsMadeDesc {
    return Intl.message(
      'No payment is received or made through the app. Payment of the Qurbani price is made between the owner and the partners independently of the app.',
      name: 'HowPaymentsMadeDesc',
      desc: '',
      args: [],
    );
  }

  /// `How to divide the Qurbani meat?`
  String get HowDivideMeat {
    return Intl.message(
      'How to divide the Qurbani meat?',
      name: 'HowDivideMeat',
      desc: '',
      args: [],
    );
  }

  /// `After the Qurbani is slaughtered, the distribution of the meat is carried out in a manner determined by the owner and the partners among themselves. According to Islamic rules, the meat must be divided fairly.`
  String get HowDivideMeatDesc {
    return Intl.message(
      'After the Qurbani is slaughtered, the distribution of the meat is carried out in a manner determined by the owner and the partners among themselves. According to Islamic rules, the meat must be divided fairly.',
      name: 'HowDivideMeatDesc',
      desc: '',
      args: [],
    );
  }

  /// `What should I do if I have problems with the app?`
  String get WhatShouldIDoIHaveProblems {
    return Intl.message(
      'What should I do if I have problems with the app?',
      name: 'WhatShouldIDoIHaveProblems',
      desc: '',
      args: [],
    );
  }

  /// `For technical problems, suggestions or questions, please send an e-mail to`
  String get WhatShouldIDoIHaveProblemsDesc {
    return Intl.message(
      'For technical problems, suggestions or questions, please send an e-mail to',
      name: 'WhatShouldIDoIHaveProblemsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number Required`
  String get PhoneNoRequired {
    return Intl.message(
      'Phone Number Required',
      name: 'PhoneNoRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number to continue`
  String get PhoneNoRequiredDesc {
    return Intl.message(
      'Please enter your phone number to continue',
      name: 'PhoneNoRequiredDesc',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNo {
    return Intl.message(
      'Phone Number',
      name: 'phoneNo',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number format`
  String get InvalidPhoneNoFormat {
    return Intl.message(
      'Invalid phone number format',
      name: 'InvalidPhoneNoFormat',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number with the format`
  String get PleasePhoneNo {
    return Intl.message(
      'Please enter a valid phone number with the format',
      name: 'PleasePhoneNo',
      desc: '',
      args: [],
    );
  }

  /// `Update Phone Number`
  String get addPhoneNo {
    return Intl.message(
      'Update Phone Number',
      name: 'addPhoneNo',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Approval Date`
  String get ApprovalDate {
    return Intl.message(
      'Approval Date',
      name: 'ApprovalDate',
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
