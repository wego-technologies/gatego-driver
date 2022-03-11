class DebugUtils {
  bool _inDebugMode = false;

  String get baseUrl {
    assert(_inDebugMode = true);
    if (false) {
      return "https://api-dev.gatego.io/";
    } else {
      return "https://api.gatego.io/";
    }
  }
}
