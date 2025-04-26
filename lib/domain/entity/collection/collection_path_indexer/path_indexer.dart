class PathIndexer {
  final Map<String, List<String>> _storage = {};

  void clear() => _storage.clear();

  List<String>? operator [](String key) => _storage[key];

  void operator []=(String key, List<String> value) =>
      _storage[key] = List.from(value);

  bool containsKey(String key) => _storage.containsKey(key);
}
