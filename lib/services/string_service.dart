class StringService {
  String formatPhoneNumber(String phone, String countryCode) {
    String cleanedPhone = phone.replaceAll(RegExp(r'\s+'), '');

    if (cleanedPhone.startsWith('0')) {
      cleanedPhone = cleanedPhone.substring(1);
    }

    if (countryCode == "+90" &&
        cleanedPhone.length == 10 &&
        cleanedPhone.startsWith('5')) {
      return cleanedPhone;
    }

    return phone;
  }
}
