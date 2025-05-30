import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/domain/common/entity_base.dart';
import 'package:kurbandas/core/utils/extensions/map_extensions.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends EntityBase {
  String? name;
  String? surname;
  String? email;
  String? token;
  String? phoneNo;
  String? accessToken;

  User(
      {this.name,
      this.surname,
      this.email,
      this.phoneNo,
      this.accessToken,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromGoogle(
      {required String displayName,
      required String email,
      required String accessToken}) {
    List<String>? nameSurname = splitName(displayName);
    String? name, surname;
    if (nameSurname != null) {
      name = nameSurname[0];
      surname = nameSurname[1];
    } else {
      name = displayName;
    }
    return User(
        name: name, surname: surname, email: email, accessToken: accessToken);
  }

  factory User.fromApple({required String displayName, required String email}) {
    List<String>? nameSurname = splitName(displayName);
    String? name, surname;
    if (nameSurname != null) {
      name = nameSurname[0];
      surname = nameSurname[1];
    } else {
      name = displayName;
    }
    return User(name: name, surname: surname, email: email);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$UserToJson(this);
    json.clearNulls();
    return json;
  }

  String get fullName => "$name ${surname ?? ""}";

  static List<String>? splitName(String name) {
    List<String> nameList = name.split(" ");
    if (nameList.length > 1) {
      return [
        nameList.sublist(0, nameList.length - 1).join(" "),
        nameList[nameList.length - 1]
      ];
    }

    return null;
  }
}
