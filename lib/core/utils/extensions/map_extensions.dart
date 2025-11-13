import 'package:kurbandas/core/utils/extensions/list_extensions.dart';

extension MapExtensions on Map {
  void clearNulls() {
    Iterable iterableKeys = keys.toList();

    for (dynamic key in iterableKeys) {
      if (this[key] == null) {
        remove(key);
      }
    }
  }

  String convertJson() {
    String json = "{";

    Iterable iterableKeys = keys.toList();

    for (dynamic key in iterableKeys) {
      if (this[key] is Map) {
        json += "\"$key\":${(this[key] as Map).convertJson()},";
      } else if (this[key] is List) {
        json += "\"$key\":${(this[key] as List).convertJson()},";
      } else {
        json += "\"$key\":\"${this[key]}\",";
      }
    }

    json += "}";

    return json;
  }
}
