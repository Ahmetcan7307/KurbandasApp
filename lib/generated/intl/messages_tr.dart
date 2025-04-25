// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
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
  String get localeName => 'tr';

  static String m0(name) =>
      "${name} kişisinin ortaklık talebini onaylamak istediğinize emin misiniz?";

  static String m1(name) =>
      "${name} kişisinin ortaklık talebini reddetmek istediğinize emin misiniz?";

  static String m2(animal) =>
      "${animal} kurban ilanını silmek istediğinize emin misiniz?";

  static String m3(count) => "${count} ortak kaldı";

  static String m4(name) => "${name} kişisinin talebi onaylandı";

  static String m5(name) => "${name} kişisinin talebi reddedildi";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AccountOperations":
            MessageLookupByLibrary.simpleMessage("Hesap İşlemleri"),
        "FilterQurbani":
            MessageLookupByLibrary.simpleMessage("Kurbanları Filtrele"),
        "Location": MessageLookupByLibrary.simpleMessage("Konum"),
        "MyPartnerships": MessageLookupByLibrary.simpleMessage("Ortaklıklarım"),
        "MyProfile": MessageLookupByLibrary.simpleMessage("Profilim"),
        "PartnershipsCompleted":
            MessageLookupByLibrary.simpleMessage("Ortaklıklar tamamlandı"),
        "ProfileDetails":
            MessageLookupByLibrary.simpleMessage("Profil Bilgileri"),
        "QurbaniAnimal": MessageLookupByLibrary.simpleMessage("Kurban Hayvanı"),
        "QurbaniPostDeleted":
            MessageLookupByLibrary.simpleMessage("Kurban ilanı silindi"),
        "Requests": MessageLookupByLibrary.simpleMessage("İstekler"),
        "SelectDistrict": MessageLookupByLibrary.simpleMessage("İlçe Seçin"),
        "SelectProvince": MessageLookupByLibrary.simpleMessage("İl Seçin"),
        "SigningOut":
            MessageLookupByLibrary.simpleMessage("Çıkış Yapılıyor..."),
        "SigninwithGoogle":
            MessageLookupByLibrary.simpleMessage("Google ile Giriş Yap"),
        "account": MessageLookupByLibrary.simpleMessage("Hesap"),
        "app": MessageLookupByLibrary.simpleMessage("Uygulama"),
        "appUpdateRequired": MessageLookupByLibrary.simpleMessage(
            "Uygulama Güncellemesi Gerekli"),
        "apply": MessageLookupByLibrary.simpleMessage("Uygula"),
        "approve": MessageLookupByLibrary.simpleMessage("Onayla"),
        "approveRequest": MessageLookupByLibrary.simpleMessage("İsteği Onayla"),
        "approved": MessageLookupByLibrary.simpleMessage("Onaylanmış"),
        "areYouSureApproveRequest": m0,
        "areYouSureDeclineRequest": m1,
        "areYouSureDeleteQurbani": m2,
        "areYouSureDeleteQurbaniDesc": MessageLookupByLibrary.simpleMessage(
            "Bu işlem geri alınamaz ve tüm ortaklıklar iptal edilir."),
        "call": MessageLookupByLibrary.simpleMessage("Ara"),
        "cancel": MessageLookupByLibrary.simpleMessage("İptal"),
        "clear": MessageLookupByLibrary.simpleMessage("Temizle"),
        "cutAddress": MessageLookupByLibrary.simpleMessage("Kesim Yeri"),
        "decline": MessageLookupByLibrary.simpleMessage("Reddet"),
        "declineRequest": MessageLookupByLibrary.simpleMessage("İsteği Reddet"),
        "delete": MessageLookupByLibrary.simpleMessage("Kaldır"),
        "deleteQurbani":
            MessageLookupByLibrary.simpleMessage("Kurban İlanını Kaldır"),
        "edit": MessageLookupByLibrary.simpleMessage("Düzenle"),
        "findPartnersQurbani": MessageLookupByLibrary.simpleMessage(
            "Kurban için ortaklarınızı kolayca bulun"),
        "help": MessageLookupByLibrary.simpleMessage("Yardım ve Destek"),
        "info": MessageLookupByLibrary.simpleMessage("Hakkında"),
        "lang": MessageLookupByLibrary.simpleMessage("Dil"),
        "later": MessageLookupByLibrary.simpleMessage("Daha Sonra"),
        "logout": MessageLookupByLibrary.simpleMessage("Çıkış Yap"),
        "logoutConfirmation": MessageLookupByLibrary.simpleMessage(
            "Çıkış yapmak istediğinizden emin misiniz?"),
        "myQurbanies": MessageLookupByLibrary.simpleMessage("Kurbanlarım"),
        "newQurbani": MessageLookupByLibrary.simpleMessage("Yeni Kurban"),
        "noApprovedRequests": MessageLookupByLibrary.simpleMessage(
            "Onaylanmış hiçbir isteğiniz yok"),
        "noCutAddress":
            MessageLookupByLibrary.simpleMessage("Kesim Yeri belirtilmemiş"),
        "noMyQurbaniAds": MessageLookupByLibrary.simpleMessage(
            "Henüz kurban ilanınız bulunmuyor"),
        "noMyQurbaniAdsDesc": MessageLookupByLibrary.simpleMessage(
            "Kurban paylaşmak için ana sayfadaki \"Kurban Paylaş\" butonunu kullanabilirsiniz"),
        "noWaitingRequests": MessageLookupByLibrary.simpleMessage(
            "Bekleyen hiçbir isteğiniz yok"),
        "partners": MessageLookupByLibrary.simpleMessage("Ortak"),
        "partnersRemain": m3,
        "partnershipRequests":
            MessageLookupByLibrary.simpleMessage("Ortaklık İstekleri"),
        "pleaseUpdateToContinue": MessageLookupByLibrary.simpleMessage(
            "Uygulamayı kullanmaya devam etmek için lütfen güncelleyin."),
        "requestApproved": m4,
        "requestDate": MessageLookupByLibrary.simpleMessage("İstek Tarihi"),
        "requestDeclined": m5,
        "settings": MessageLookupByLibrary.simpleMessage("Ayarlar"),
        "updateNow": MessageLookupByLibrary.simpleMessage("Şimdi Güncelle"),
        "waiting": MessageLookupByLibrary.simpleMessage("Bekleyen")
      };
}
