import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../components/Toast.dart';
import 'UrlUtils.dart';

class ResponseData {
  final String code;
  final String message;
  final String date;

  ResponseData(this.code, this.message, this.date);

  ResponseData.fromJson(Map json)
      : code = json['code'],
        message = json['message'],
        date = json['date'];
}

class HttpUtil {
  /// global dio object
  static Dio dio;

  /// global options
  static final String apiPrefix = Url.getUrl("api");
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  static BaseOptions options = new BaseOptions(
//    baseUrl: apiPrefix,
    connectTimeout: CONNECT_TIMEOUT,
    receiveTimeout: RECEIVE_TIMEOUT,
    responseType: ResponseType.json,
  );

  static BaseOptions optionsWithoutPrefix = new BaseOptions(
    baseUrl: apiPrefix,
    connectTimeout: CONNECT_TIMEOUT,
    receiveTimeout: RECEIVE_TIMEOUT,
    responseType: ResponseType.json,
  );

  HttpUtil() {
    dio = createInstance();
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          print('请求地址：【'+ options.method + options.baseUrl + options.path+ '】');
          print('请求参数：' + options.data.toString());
          return options;
        },
        onResponse: (Response response) async {
          print('响应数据：' + response.data.toString());
          print('响应头:' + response.headers.toString());
          print('响应状态:' + response.statusCode.toString());
          print("相应数据:" + response.data.toString());
//          var res = json.decode(response.toString());
//          if (res["code"] != 0 && res["code"] != 20103) {
//            throw new DioError(response: res['message'], error: res["code"]);
//          }
          if (response.statusCode != 200) {
            throw new DioError(error: "");
          }
          return response;
        },
        onError: (DioError err) {
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
        }));
//    if (Url.isDev() && true) {
//      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//          (client) {
//        // config the http client
//        client.findProxy = (uri) {
//          //proxy all request to localhost:8888
//          // you can also create a new HttpClient to dio return new HttpClient();
//          return "PROXY 192.168.4.238:8888";
//        };
//      };
//    }
  }

  /// request method
  request(String url, {data, String method}) async {
    data = data ?? {};
    method = method ?? 'GET';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userToken = sharedPreferences.getString("access_token");
    if (userToken == null) {
    } else {
      dio.options.headers["Authorization"] = "Bearer " + userToken;
    }

    Response response = await dio.request(url,
        data: data, options: new Options(method: method));

    return response;
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      dio = new Dio(options);
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
