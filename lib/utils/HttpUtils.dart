import 'package:dio/dio.dart';


const ApiList = {
  "getProductivity":"/capacity", // 产量接口
};


class ResponseData {
  final String code;
  final DateTime message;
  final String date;

  ResponseData(this.code, this.message, this.date);

  ResponseData.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        date = json['date'];
}


class HttpUtil {

  /// global dio object
  static Dio dio;

  /// default options
  static const String API_PREFIX = 'http://192.168.180.2:8080/v1';
//  static const String API_PREFIX = 'http://192.168.5.106:8080/v1';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  static BaseOptions options = new BaseOptions(
    baseUrl: API_PREFIX,
    connectTimeout: CONNECT_TIMEOUT,
    receiveTimeout: RECEIVE_TIMEOUT,
    responseType: ResponseType.json
  );


  HttpUtil() {
    dio = createInstance();
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          print('请求地址：【' + options.method + '  ' + options.baseUrl + options.path + '】');
          print('请求参数：' + options.data.toString());
          return options;
        },
        onResponse: (Response response) {
          print('响应数据：' + response.data.toString());
          print('响应头 01:' + response.headers.toString());
          print('响应头 02:' + response.request.toString());
          print('响应状态:' + response.statusCode.toString());
          return response;
        },
        onError: (DioError err) {
          print('请求出错：' + err.toString());
          return err;
        }
    ));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      // config the http client
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        return "PROXY 192.168.180.2:8888";
      };
      // you can also create a new HttpClient to dio
      // return new HttpClient();
    };
  }

  /// request method
  request(String url, { data, method }) async {
    data = data ?? {};
    method = method ?? 'GET';

    var result;
    Response response = await dio.request(url, data: data, options: new Options(method: method));

    result = response;

    return result;
  }

  /// 创建 dio 实例对象
  static Dio createInstance () {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      dio = new Dio(options);
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear () {
    dio = null;
  }

}