import 'package:dio/dio.dart';

class CommonRequest {
  /// @des check app version
  /// @return {version} the lasted version
  /// @return {url} the lasted version app's url
  static Future version() {
    Dio dio = new Dio();
    return dio.request("");
  }
}
