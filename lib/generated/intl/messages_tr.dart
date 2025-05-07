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
        "EnterInfoPlace": MessageLookupByLibrary.simpleMessage(
            "Kurbanınızın kesileceği yer hakkında bilgi girin"),
        "FilterQurbani":
            MessageLookupByLibrary.simpleMessage("Kurbanları Filtrele"),
        "ImportantInfo": MessageLookupByLibrary.simpleMessage("Önemli Bilgi"),
        "ImportantInfoDesc": MessageLookupByLibrary.simpleMessage(
            "Bir kurban maksimum 7 ortak olabilir."),
        "Location": MessageLookupByLibrary.simpleMessage("Konum"),
        "LocationInfo": MessageLookupByLibrary.simpleMessage("Konum Bilgileri"),
        "MaximumPartners7": MessageLookupByLibrary.simpleMessage(
            "En fazla 7 ortak sayısı olabilir"),
        "MyPartnerships": MessageLookupByLibrary.simpleMessage("Ortaklıklarım"),
        "MyProfile": MessageLookupByLibrary.simpleMessage("Profilim"),
        "NoQurbani":
            MessageLookupByLibrary.simpleMessage("Hiç kurban bulunamadı"),
        "NoQurbaniDesc": MessageLookupByLibrary.simpleMessage(
            "Kurban paylaşmak için \"Yeni Kurban\" butonuna tıklayın"),
        "PartnershipsCompleted":
            MessageLookupByLibrary.simpleMessage("Ortaklıklar tamamlandı"),
        "Preview": MessageLookupByLibrary.simpleMessage("Önizleme"),
        "QurbaniAnimal": MessageLookupByLibrary.simpleMessage("Kurban Hayvanı"),
        "QurbaniInfo": MessageLookupByLibrary.simpleMessage("Kurban Bilgileri"),
        "QurbaniPostDeleted":
            MessageLookupByLibrary.simpleMessage("Kurban ilanı silindi"),
        "Requests": MessageLookupByLibrary.simpleMessage("İstekler"),
        "SelectDistrict": MessageLookupByLibrary.simpleMessage("İlçe Seçin"),
        "SelectProvince": MessageLookupByLibrary.simpleMessage("İl Seçin"),
        "SigningOut":
            MessageLookupByLibrary.simpleMessage("Çıkış Yapılıyor..."),
        "SigninwithGoogle":
            MessageLookupByLibrary.simpleMessage("Google ile Giriş Yap"),
        "SuccessfullySentRequest": MessageLookupByLibrary.simpleMessage(
            "Başarılı bir şekilde istek gönderildi"),
        "active": MessageLookupByLibrary.simpleMessage("Aktif"),
        "all": MessageLookupByLibrary.simpleMessage("Tümü"),
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
        "completed": MessageLookupByLibrary.simpleMessage("Tamamlanan"),
        "confirmQurbaniInfo": MessageLookupByLibrary.simpleMessage(
            "Kurban Bilgilerini Onaylayın"),
        "continueTxt": MessageLookupByLibrary.simpleMessage("Devam Et"),
        "count": MessageLookupByLibrary.simpleMessage("Sayısı"),
        "cut": MessageLookupByLibrary.simpleMessage("Kesildi"),
        "cutAddress": MessageLookupByLibrary.simpleMessage("Kesim Yeri"),
        "cutDate": MessageLookupByLibrary.simpleMessage("Kesim Tarihi"),
        "decline": MessageLookupByLibrary.simpleMessage("Reddet"),
        "declineRequest": MessageLookupByLibrary.simpleMessage("İsteği Reddet"),
        "delete": MessageLookupByLibrary.simpleMessage("Kaldır"),
        "deleteQurbani":
            MessageLookupByLibrary.simpleMessage("Kurban İlanını Kaldır"),
        "differentFilters": MessageLookupByLibrary.simpleMessage(
            "Farklı filtreler deneyebilirsiniz"),
        "district": MessageLookupByLibrary.simpleMessage("İlçe"),
        "edit": MessageLookupByLibrary.simpleMessage("Düzenle"),
        "enterCutAddress": MessageLookupByLibrary.simpleMessage(
            "Kesim alanının adını giriniz"),
        "enterPrice":
            MessageLookupByLibrary.simpleMessage("Kurbanın fiyatını giriniz"),
        "enterTotalPartnersCount":
            MessageLookupByLibrary.simpleMessage("Ortak Sayısını giriniz"),
        "enterWeight":
            MessageLookupByLibrary.simpleMessage("Kurbanın ağırlığını girin"),
        "error": MessageLookupByLibrary.simpleMessage("Hata"),
        "fillRequiredInfo": MessageLookupByLibrary.simpleMessage(
            "Lütfen tüm gerekli bilgileri doldurun"),
        "filters": MessageLookupByLibrary.simpleMessage("Filtreler"),
        "findPartnersQurbani": MessageLookupByLibrary.simpleMessage(
            "Kurban için ortaklarınızı kolayca bulun"),
        "help": MessageLookupByLibrary.simpleMessage("Yardım ve Destek"),
        "info": MessageLookupByLibrary.simpleMessage("Hakkında"),
        "later": MessageLookupByLibrary.simpleMessage("Daha Sonra"),
        "logout": MessageLookupByLibrary.simpleMessage("Çıkış Yap"),
        "logoutConfirmation": MessageLookupByLibrary.simpleMessage(
            "Çıkış yapmak istediğinizden emin misiniz?"),
        "message": MessageLookupByLibrary.simpleMessage("Mesaj"),
        "myQurbanies": MessageLookupByLibrary.simpleMessage("Kurbanlarım"),
        "noApprovedRequests": MessageLookupByLibrary.simpleMessage(
            "Onaylanmış hiçbir isteğiniz yok"),
        "noCutDate":
            MessageLookupByLibrary.simpleMessage("Kesim Tarihi belirtilmemiş"),
        "noMyQurbaniAds": MessageLookupByLibrary.simpleMessage(
            "Henüz kurban ilanınız bulunmuyor"),
        "noMyQurbaniAdsDesc": MessageLookupByLibrary.simpleMessage(
            "Kurban paylaşmak için ana sayfadaki \"Kurban Paylaş\" butonunu kullanabilirsiniz"),
        "noPartnerships": MessageLookupByLibrary.simpleMessage(
            "Henüz katıldığınız bir kurban bulunmuyor"),
        "noPartnershipsDesc": MessageLookupByLibrary.simpleMessage(
            "Ana sayfadan kurban ilanlarına göz atıp hisse satın alabilirsiniz"),
        "noWaitingRequests": MessageLookupByLibrary.simpleMessage(
            "Bekleyen hiçbir isteğiniz yok"),
        "owner": MessageLookupByLibrary.simpleMessage("Sahip"),
        "partner": MessageLookupByLibrary.simpleMessage("Ortak"),
        "partners": MessageLookupByLibrary.simpleMessage("Ortaklar"),
        "partnersRemain": m3,
        "partnershipDate":
            MessageLookupByLibrary.simpleMessage("Ortaklık Tarihi"),
        "partnershipRequests":
            MessageLookupByLibrary.simpleMessage("Ortaklık İstekleri"),
        "partnershipState":
            MessageLookupByLibrary.simpleMessage("Ortaklık Durumu"),
        "pleaseCutAddress": MessageLookupByLibrary.simpleMessage(
            "Lütfen kesim alanının adını giriniz"),
        "pleaseDistrict":
            MessageLookupByLibrary.simpleMessage("Lütfen ilçeyi seçin"),
        "pleasePrice": MessageLookupByLibrary.simpleMessage(
            "Lütfen Kurbanın fiyatını giriniz"),
        "pleaseProvince":
            MessageLookupByLibrary.simpleMessage("Lütfen ili seçin"),
        "pleaseSelectAnimal": MessageLookupByLibrary.simpleMessage(
            "Lütfen Kurban hayvanını seçin"),
        "pleaseTotalPartnersCount": MessageLookupByLibrary.simpleMessage(
            "Lütfen Ortak Sayısını giriniz"),
        "pleaseUpdateToContinue": MessageLookupByLibrary.simpleMessage(
            "Uygulamayı kullanmaya devam etmek için lütfen güncelleyin."),
        "pleaseWeight": MessageLookupByLibrary.simpleMessage(
            "Lütfen Kurbanın ağırlığını girin"),
        "previous": MessageLookupByLibrary.simpleMessage("Geri"),
        "price": MessageLookupByLibrary.simpleMessage("Fiyat"),
        "province": MessageLookupByLibrary.simpleMessage("İl"),
        "remain": MessageLookupByLibrary.simpleMessage("Kalan"),
        "requestApproved": m4,
        "requestDate": MessageLookupByLibrary.simpleMessage("İstek Tarihi"),
        "requestDeclined": m5,
        "selectAnimal":
            MessageLookupByLibrary.simpleMessage("Kurban hayvanını seçin"),
        "sendRequest":
            MessageLookupByLibrary.simpleMessage("Ortak Olma İsteği Gönder"),
        "settings": MessageLookupByLibrary.simpleMessage("Ayarlar"),
        "shareQurbani": MessageLookupByLibrary.simpleMessage("Kurban Paylaş"),
        "shared": MessageLookupByLibrary.simpleMessage("Paylaşıldı"),
        "successfullyShared":
            MessageLookupByLibrary.simpleMessage("Kurban başarıyla paylaşıldı"),
        "total": MessageLookupByLibrary.simpleMessage("Toplam"),
        "totalPartnersCount":
            MessageLookupByLibrary.simpleMessage("Toplam Ortak Sayısı"),
        "totalPartnersCountMax":
            MessageLookupByLibrary.simpleMessage("Ortak Sayısı (max 7)"),
        "updateNow": MessageLookupByLibrary.simpleMessage("Şimdi Güncelle"),
        "validPrice":
            MessageLookupByLibrary.simpleMessage("Geçerli bir fiyat giriniz"),
        "validTotalPartnersCount": MessageLookupByLibrary.simpleMessage(
            "Geçerli bir ortak sayısı giriniz"),
        "validWeight":
            MessageLookupByLibrary.simpleMessage("Geçerli bir ağırlık giriniz"),
        "waiting": MessageLookupByLibrary.simpleMessage("Bekleyen"),
        "weight": MessageLookupByLibrary.simpleMessage("Ağırlık")
      };
}
