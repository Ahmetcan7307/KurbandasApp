class Exceptions {
  static String translate(String error, String languageCode) {
    if (languageCode == "tr") {
      switch (error) {
        case "phoneNo must be unique":
          return "Telefon numarası unik olmalıdır!";
        default:
          return "Bir hata oluştu: $error";
      }
    }

    return error;
  }
}
