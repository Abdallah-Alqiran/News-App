
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/core/constant/api_constant.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/data/model/dio_helper_model.dart';

class HomeServices {
  static Future<TopHeadLineModel?> getTopHeadline() async{
    try {
      final response = await DioHeloper.getRequest(
        endPoint: ApiConstant.topHeadLines,
        query: {
          "country": "us",
          "apiKey": ApiConstant.apiKey,
          "category": "Technology",
        } 
      );

      TopHeadLineModel topHeadLineModel =  TopHeadLineModel.fromJson(response.data);
      return topHeadLineModel;
    } on DioException catch (e) {
      log("dio error is: ${e.message}");
    }
    return null;
  }
}