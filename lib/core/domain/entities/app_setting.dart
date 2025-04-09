import 'package:json_annotation/json_annotation.dart';

part 'app_setting.g.dart';

@JsonSerializable(createToJson: false)
class AppSetting {
  String requiredVersion;

  AppSetting(this.requiredVersion);

  factory AppSetting.fromJson(Map<String, dynamic> json) =>
      _$AppSettingFromJson(json);
}
