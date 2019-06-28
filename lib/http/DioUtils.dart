import 'package:dio/dio.dart';

/// @author: jm
/// @date: 2019/6/28 11:01
/// @Version:1.0
/// @Description: Dio网络框架基础封装

class DioUtils {
  static Dio _dio;
  static DioUtils _dioUtils;

  static DioUtils getInstance() {
    if (_dioUtils == null) {
      BaseOptions options = new BaseOptions();
      options.baseUrl = "https://www.wanandroid.com";
      options.connectTimeout = 5000;
      options.receiveTimeout = 5000;

      _dio = new Dio(options);
    }

    return _dioUtils;
  }

  doPost(String path,
      {Map<String, dynamic> queryParameters,
      Options options,
      Function errorCallBack}) async {
//    if (options != null) {
//      dio.options = options;
//    }
    Response response = await _dio.post(path,
        queryParameters: queryParameters, options: options);
    print(response.toString());

    if (response.statusCode == 200) {
//      successCallBack(response.data);
      print(response.data.toString());
    } else {
      errorCallBack(response.statusCode + response.data);
    }
  }
}
