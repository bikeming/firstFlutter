import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// @author: jm
/// @date: 2019/6/28 16:39
/// @Version:1.0
/// @Description:
///
class Method {
  static final String GET = "get";
  static final String POST = "post";
}

class DioUtil {
  ///wanandroid接口返回类型
  static final String DATA = "data";
  static final String CODE = "errorCode";
  static final String MSG = "errorMsg";

  Dio dio;
  static DioUtil _instance;

  static DioUtil getInstance() {
    if (_instance == null) {
      _instance = DioUtil();
    }
    return _instance;
  }

  DioUtil() {
    BaseOptions options = new BaseOptions();
    options.baseUrl = "https://www.wanandroid.com";
    options.connectTimeout = 5000;
    options.receiveTimeout = 5000;

    dio = new Dio(options);
  }

  ///get请求
  get(String url, Function successCallBack,
      {Map<String, dynamic> queryParameters, Function errorCallBack}) async {
    _requstHttp(
        url, successCallBack, Method.GET, queryParameters, errorCallBack);
  }

  ///post请求
  post(String url, Function successCallBack,
      {Map<String, dynamic> params, Function errorCallBack}) async {
    _requstHttp(url, successCallBack, Method.POST, params, errorCallBack);
  }

  ///post请求
  postFormData(String url, Function successCallBack,
      {FormData formDatas, Function errorCallBack}) async {
    _requstHttp(url, successCallBack, Method.POST, formDatas, errorCallBack);
  }

  Future requst(String method, String url, [params]) async {
    try {
      Response response;
//      _addStartHttpInterceptor(dio); //添加请求之前的拦截器
      if (method == Method.GET) {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == Method.POST) {
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

      if (response.statusCode == 200) {
        String dataStr = json.encode(response.data);
        print("ResponseData=>>>" + dataStr);

        Map<String, dynamic> dataMap = json.decode(dataStr);
        if (dataMap != null && dataMap[CODE] == 0) {
          return dataMap[DATA];
        } else {
          throw Exception('errorCode' +
              dataMap[CODE].toString() +
              "\nerrorMsg" +
              dataMap[MSG]);
        }
      } else {
        throw Exception(
            'response.statusCode=' + response.statusCode.toString());
      }
    } catch (e) {
      throw Exception('Exception${e}');
    }
  }

  _requstHttp(String url, Function successCallBack,
      [String method, params, Function errorCallBack]) async {
    String errorMsg = '';
    int code;

    try {
      Response response;
//      _addStartHttpInterceptor(dio); //添加请求之前的拦截器
      if (method == Method.GET) {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == Method.POST) {
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
        _error(errorCallBack, errorMsg);
        return;
      }

      String dataStr = json.encode(response.data);
      Map<String, dynamic> dataMap = json.decode(dataStr);
      if (dataMap != null && dataMap[CODE] != 0) {
        errorMsg =
            '错误码：' + dataMap[CODE].toString() + '，' + response.data.toString();
        _error(errorCallBack, errorMsg);
        return;
      }

      if (successCallBack != null) {
        successCallBack(dataMap[DATA]);
      }
    } catch (exception) {
      _error(errorCallBack, exception.toString());
    }
  }

  _error(Function errorCallBack, String error) {
    Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }
}
