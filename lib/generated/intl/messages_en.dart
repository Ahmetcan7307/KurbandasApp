// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(animal) =>
      "Are you sure you want to delete the ${animal} Qurbani?";

  static String m1(count) => "${count} partners remain";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AccountOperations":
            MessageLookupByLibrary.simpleMessage("Account Operations"),
        "FilterQurbani": MessageLookupByLibrary.simpleMessage("Filter Qurbani"),
        "Location": MessageLookupByLibrary.simpleMessage("Location"),
        "MyPartnerships":
            MessageLookupByLibrary.simpleMessage("My Partnerships"),
        "MyProfile": MessageLookupByLibrary.simpleMessage("My Profile"),
        "PartnershipsCompleted":
            MessageLookupByLibrary.simpleMessage("Partnerships completed"),
        "ProfileDetails":
            MessageLookupByLibrary.simpleMessage("Profile Details"),
        "QurbaniAnimal": MessageLookupByLibrary.simpleMessage("Qurbani Animal"),
        "QurbaniPostDeleted": MessageLookupByLibrary.simpleMessage(
            "Qurbani announcement deleted"),
        "Requests": MessageLookupByLibrary.simpleMessage("Requests"),
        "SelectDistrict":
            MessageLookupByLibrary.simpleMessage("Select District"),
        "SelectProvince":
            MessageLookupByLibrary.simpleMessage("Select Province"),
        "SigningOut": MessageLookupByLibrary.simpleMessage("Signing out..."),
        "SigninwithGoogle":
            MessageLookupByLibrary.simpleMessage("Sign in with Google"),
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "app": MessageLookupByLibrary.simpleMessage("Application"),
        "appUpdateRequired":
            MessageLookupByLibrary.simpleMessage("App Update Required"),
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "areYouSureDeleteQurbani": m0,
        "areYouSureDeleteQurbaniDesc": MessageLookupByLibrary.simpleMessage(
            "This action is irreversible and all partnerships are canceled."),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "cutAddress": MessageLookupByLibrary.simpleMessage("Cut Address"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteQurbani":
            MessageLookupByLibrary.simpleMessage("Delete Qurbani Posting"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "findPartnersQurbani": MessageLookupByLibrary.simpleMessage(
            "Easily find your partners for Qurbani"),
        "help": MessageLookupByLibrary.simpleMessage("Help and Support"),
        "info": MessageLookupByLibrary.simpleMessage("Information"),
        "lang": MessageLookupByLibrary.simpleMessage("Language"),
        "later": MessageLookupByLibrary.simpleMessage("Later"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "logoutConfirmation": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out?"),
        "myQurbanies": MessageLookupByLibrary.simpleMessage("My Qurbanies"),
        "newQurbani": MessageLookupByLibrary.simpleMessage("New Qurbani"),
        "noCutAddress": MessageLookupByLibrary.simpleMessage("No Cut Address"),
        "noMyQurbaniAds": MessageLookupByLibrary.simpleMessage(
            "You do not have any sacrifice announcements yet"),
        "noMyQurbaniAdsDesc": MessageLookupByLibrary.simpleMessage(
            "You can use the “Share Qurbani” button on the home page to share your Qurbani"),
        "partners": MessageLookupByLibrary.simpleMessage("Partners"),
        "partnersRemain": m1,
        "pleaseUpdateToContinue": MessageLookupByLibrary.simpleMessage(
            "Please update to continue using the app."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "updateNow": MessageLookupByLibrary.simpleMessage("Update Now")
      };
}
