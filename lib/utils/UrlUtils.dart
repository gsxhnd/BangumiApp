class Url {
  static const String _devApiUrl = "https://bgm.tv";
  static const String _proApiUrl = "https://bgm.tv";
  static const String _devStaticUrl = "";
  static const String _proStaticUrl = "";
  static const String _devWebViewUrl = "";
  static const String _proWebViewUrl = "http://192.168.4.238:8080";

  factory Url() {
    final getUrl = Url._internal();
    return getUrl;
  }
  Url._internal();

  /// @params type "api","static", "webview"
  /// @return String: url
  static getUrl(String type) {
    if (type == "api") {
      return isDev() ? _devApiUrl : _proApiUrl;
    } else if (type == "static") {
      return isDev() ? _devStaticUrl : _proStaticUrl;
    } else if (type == "webview") {
      return isDev() ? _devWebViewUrl : _proWebViewUrl;
    }
  }

  /// 当前环境是否为开发模式
  static bool isDev({status: true}) {
    return status;
  }
}
