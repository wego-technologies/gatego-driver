class DebugUtils {
  bool _inDebugMode = false;

  String get baseUrl {
    assert(_inDebugMode = true);
    if (_inDebugMode) {
      return "https://dev.cloud.gatego.io/";
    } else {
      return "https://cloud.gatego.io/";
    }
  }
}
