import 'package:BangumiApp/config.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/Toast.dart';

class HttpUtil {
  static Dio dio;
  static HttpUtil _instance;

  static BaseOptions options = new BaseOptions(
    baseUrl: "https://bgm.tv",
    connectTimeout: 10000,
    receiveTimeout: 10000,
    responseType: ResponseType.json,
  );

  HttpUtil() {
    dio = new Dio(options);
    dio.interceptors.add(CustomInterceptors());
    if (!config.isProd) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          //proxy all request to localhost:8888
          // you can also create a new HttpClient to dio return new HttpClient();
          return "PROXY 192.168.4.238:8888";
        };
      };
    }
  }

  /// request method
  request(String url, {data, String method}) async {
    data = data ?? {};
    method = method ?? 'GET';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userToken = sharedPreferences.getString("access_token");
    if (userToken != null) {
      dio.options.headers["Authorization"] = "Bearer " + userToken;
    }
    options.method = method;
    Response response = await dio.request(
      url,
      data: data,
      options: Options(method: method),
    );

    return response;
  }

  static HttpUtil getInstance() {
    if (null == _instance) {
      _instance = new HttpUtil();
      return _instance;
    }
    return _instance;
  }
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print('请求地址：【' + options.method + options.baseUrl + options.path + '】');
    print('请求参数：' + options.data.toString());
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('响应数据：' + response.data.toString());
    print('响应头:' + response.headers.toString());
    print('响应状态:' + response.statusCode.toString());
    if (response.statusCode != 200) {
      throw new DioError(error: "");
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    switch (err.error) {
      case (20103):
        Toast.fail("Token异常或过期，请重新登录");
        break;
      case (20104):
        Toast.warm("帐号或密码错误");
        break;
    }
    switch (err.type.index) {
      case (0):
        Toast.fail("网络超时");
        break;
      case (1):
        Toast.fail("网络超时");
        break;
      case (2):
        Toast.fail("网络超时");
        break;
      default:
        Toast.warm(err.message.toString());
        print("default:" + err.message.toString());
        break;
    }
    return super.onError(err);
  }
}
