import 'package:flutter_test/flutter_test.dart';

import '../lib/utils/UrlUtils.dart';

void main() {
  const String _devApiUrl = "http://192.168.199.187:8080/static/";
  const String _proApiUrl = "http://api.zizhaotech.com/static/";
  const String _devStaticUrl = "http://192.168.199.187:8080/";
  const String _proStaticUrl = "http://api.zizhaotech.com/static/";

  test('api url', () {
    if (Url.isDev()) {
      expect(Url.getUrl("api"), _devApiUrl);
    } else {
      expect(Url.getUrl("api"), _proApiUrl);
    }
  });

  test('upload url', () {
    if (Url.isDev()) {
      expect(Url.getUrl("static"), _devStaticUrl);
    } else {
      expect(Url.getUrl("static"), _proStaticUrl);
    }
  });
}