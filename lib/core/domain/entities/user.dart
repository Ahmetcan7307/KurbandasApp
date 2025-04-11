import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/utils/extensions/map_extensions.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? surname;
  String email;
  String? token;
  String? phoneNo;

  User({this.name, this.surname, required this.email, this.phoneNo});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromGoogle(
      {required String displayName, required String email, String? phoneNo}) {
    List<String>? nameSurname = splitName(displayName);
    String? name, surname;
    if (nameSurname != null) {
      name = nameSurname[0];
      surname = nameSurname[1];
    } else {
      name = displayName;
    }
    return User(name: name, surname: surname, email: email, phoneNo: phoneNo);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$UserToJson(this);
    json.clearNulls();
    return json;
  }

  static List<String>? splitName(String? name) {
    List<String>? nameList = name?.split(" ");
    if (nameList != null) {
      return [
        nameList.sublist(0, nameList.length - 1).join(" "),
        nameList[nameList.length - 1]
      ];
    }

    return null;
  }
}
