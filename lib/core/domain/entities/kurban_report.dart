import 'package:json_annotation/json_annotation.dart';
import 'package:kurbandas/core/utils/extensions/map_extensions.dart';

part 'kurban_report.g.dart';

@JsonSerializable(createFactory: false)
class KurbanReport {
  String? why;
  int? quickWhy;

  KurbanReport({this.why, this.quickWhy});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$KurbanReportToJson(this);
    json.clearNulls();

    return json;
  }
}
