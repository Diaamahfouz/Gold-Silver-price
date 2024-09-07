import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

// https://www.goldapi.io/api/XAU/USD


  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: "https://www.goldapi.io/api/",
        receiveDataWhenStatusError: true,
      )
    );
  }



static Future<Response> getData(String url) {
  dio!.options.headers={
    'x-access-token':'goldapi-18a6c8slzj4qhyh-io'
  };

  return dio!.get(url);
}

}

