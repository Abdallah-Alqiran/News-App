import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/core/constant/api_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHeloper {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  static getRequest({
    required String endPoint,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response = await dio!.get(endPoint, queryParameters: query);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
