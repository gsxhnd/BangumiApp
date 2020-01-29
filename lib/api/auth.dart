import '../utils/HttpUtil.dart';

class AuthRequest {
  /// 第三方应用使用 code（验证代码）换取 Access Token
  /// 返回:
  /// "access_token":"YOUR_ACCESS_TOKEN",
  /// "expires_in":604800,
  /// "token_type":"Bearer",
  /// "scope":null,
  /// "refresh_token":"YOUR_REFRESH_TOKEN"
  /// "user_id" : USER_ID
  static Future getAccessToken(String code) async {
//    Map data = {
//      "grant_type": "authorization_code",
//      "client_id": "bgm9015c6118aa20348",
//      "client_secret": "client_secret",
//      "code": code,
//      "redirect_uri": "http:///code",
//      "state": "12313"
//    };
    String url = "http://192.168.4.238:8080/code?code=$code";
    return HttpUtil().request(url, method: "GET");
  }

  /// 授权有效期刷新
  /// 在 /oauth/access_token API 的返回中，我们提供了 Refresh Token 以便第三方应用延续 Access Token 的有效期
  /// 返回
  /// "access_token":"YOUR_NEW_ACCESS_TOKEN",
  /// "expires_in":604800,
  /// "token_type":"Bearer",
  /// "scope":null,
  /// "refresh_token":"YOUR_NEW_REFRESH_TOKEN"
  static Future refreshAccessToken(String refreshToken) {
    Map data = {
      "grant_type": "refresh_token",
      "client_id": "bgm9015c6118aa20348",
      "client_secret": "client_secret",
      "refresh_token": refreshToken,
      "redirect_uri": "http:///code",
    };
    return HttpUtil()
        .request("/oauth/access_token", method: "POST", data: data);
  }

  /// 获取当前 Access Token 的相关信息
  /// 返回：
  ///  "access_token":"YOUR_ACCESS_TOKEN",
  ///  "client_id":"YOUR_CLIENT_ID",
  ///  "expires": 1520323182
  ///  "scope":null,
  ///  "user_id" : USER_ID
  static Future getAccessTokenStatus(String accessToken) {
    return HttpUtil()
        .request("https://bgm.tv/oauth/token_status", method: "POST");
  }
}
