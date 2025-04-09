import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/utils/extensions/map_extensions.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? surname;
  String email;
  String? token;

  User({this.name, this.surname, required this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$UserToJson(this);
    json.clearNulls();
    return json;
  }
}
