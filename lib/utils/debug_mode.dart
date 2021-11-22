class DebugUtils {
  bool _inDebugMode = false;

  String get baseUrl {
    assert(_inDebugMode = true);
    if (_inDebugMode) {
      return "https://api-dev.gatego.io/";
    } else {
      return "https://cloud.gatego.io/";
    }
  }
}
