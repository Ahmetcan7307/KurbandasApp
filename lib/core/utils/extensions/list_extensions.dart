extension ListExtensions on List {
  String convertJson() {
    String json = "[";

    for (dynamic item in this) {
      json += "\"$item\"";
    }

    json += "]";

    return json;
  }
}
