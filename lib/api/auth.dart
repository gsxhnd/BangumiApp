import '../utils/HttpUtil.dart';

class AuthRequest {
  static Future getAccessToken(String code) {
    Map data = {
      "grant_type": "authorization_code",
      "client_id": "bgm9015c6118aa20348",
      "client_secret": "client_secret",
      "code": code,
      "redirect_uri": "http://code",
      "state": "12313"
    };
    return HttpUtil()
        .request("/oauth/access_token", method: "POST", data: data);
  }

  static Future refreshAccessToken(String refreshToken) {
    Map data = {
      "grant_type": "refresh_token",
      "client_id": "bgm9015c6118aa20348",
      "client_secret": "client_secret",
      "refresh_token": refreshToken,
      "redirect_uri": "http://code",
    };
    return HttpUtil()
        .request("/oauth/access_token", method: "POST", data: data);
  }

  static Future getAccessTokenStatus(String accessToken) {
    Map data = {
      "access_token": accessToken,
    };
    return HttpUtil()
        .request("/oauth/token_status", method: "POST", data: data);
  }
}
