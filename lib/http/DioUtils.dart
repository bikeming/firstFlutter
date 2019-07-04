import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
/// @author: jm
/// @date: 2019/6/28 11:01
/// @Version:1.0
/// @Description: Dio网络框架基础封装

class DioUtils {
  static final String GET = "get";
  static final String POST = "post";
  static final String DATA = "data";
  static final String CODE = "errorCode";

  Dio dio;
  static DioUtils _instance;

  static DioUtils getInstance() {
    if (_instance == null) {
      _instance = DioUtils();
    }
    return _instance;
  }

  DioUtils() {
    BaseOptions options = new BaseOptions();
    options.baseUrl = "https://www.wanandroid.com";
    options.connectTimeout = 5000;
    options.receiveTimeout = 5000;

    dio = new Dio(options);
  }

  ///get请求
  get(String url,
      {Map<String, dynamic> queryParameters,
        successCallBack: Function,
        errorCallBack: Function}) async {
    _requstHttp(url, GET, queryParameters, successCallBack, errorCallBack);
  }

  ///post请求
  post(String url,
      {Map<String, dynamic> params,
        successCallBack: Function,
        errorCallBack: Function}) async {
    _requstHttp(url, POST, params, successCallBack, errorCallBack);
  }

  ///post请求
  postFormData(String url,
      {FormData formDatas,
        successCallBack: Function,
        errorCallBack: Function}) async {
    _requstHttp(url, POST, formDatas, successCallBack, errorCallBack);
  }

  _requstHttp(
      String url, String method, params, successCallBack, errorCallBack) async {
    String errorMsg = '';
    int code;

    try {
      Response response;
//      _addStartHttpInterceptor(dio); //添加请求之前的拦截器
      if (method == GET) {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == POST) {
        if (params != null && params.isNotEmpty) {
          if (params is FormData) {
            response = await dio.post(url, data: params);
          } else {
            response = await dio.post(url, queryParameters: params);
          }
        } else {
          response = await dio.post(url);
        }
      }

      code = response.statusCode;
      print(response.toString());

      if (code != 200) {
        errorMsg = '错误码：' + code.toString() + '，' + response.data.toString();
        _error(errorMsg, errorCallBack);
      } else {
        String dataStr = json.encode(response.data);
        Map<String, dynamic> dataMap = json.decode(dataStr);
        if (dataMap != null && dataMap[CODE] == 0) {
          if (successCallBack != null) {
            successCallBack(dataMap[DATA]);
//            print("response.data----------${dataMap[DATA]}");
          }
          return dataMap[DATA];
        } else {
          errorMsg = dataMap[CODE] + ',' + response.data.toString();
          _error(errorMsg, errorCallBack);
        }
      }
    } catch (exception) {
      _error(exception.toString(), errorCallBack);
    }
  }

  _error(String error,errorCallBack ) {
    Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
    if (errorCallBack != null) {
      errorCallBack(error);
    }
    return null;
  }
}
