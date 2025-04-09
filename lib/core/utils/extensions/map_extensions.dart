extension MapExtensions on Map {
  clearNulls() {
    Iterable iterableKeys = keys.toList();

    for (dynamic key in iterableKeys) {
      if (this[key] == null) {
        remove(key);
      }
    }
  }
}
