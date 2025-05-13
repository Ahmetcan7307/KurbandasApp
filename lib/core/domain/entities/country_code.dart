import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/domain/common/entity_base.dart';

part 'country_code.g.dart';

@JsonSerializable(createToJson: false)
class CountryCode extends EntityBase {
  String code;
  String country;
  String pattern;
  String example;

  CountryCode(
      {required this.code,
      required this.country,
      required this.pattern,
      required this.example});

  factory CountryCode.fromJson(Map<String, dynamic> json) {
    CountryCode countryCode = _$CountryCodeFromJson(json);
    countryCode.pattern =
        r'^{{pattern}}$'.replaceAll("{{pattern}}", countryCode.pattern);

    return countryCode;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryCode &&
          runtimeType == other.runtimeType &&
          documentId == other.documentId;

  @override
  int get hashCode => documentId.hashCode;
}
