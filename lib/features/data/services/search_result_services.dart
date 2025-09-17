import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/core/constant/api_constant.dart';
import 'package:news_app/core/constant/app_constant.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/data/model/dio_helper_model.dart';

class SearchResultServices {
  static Future<ArticlesModel?> searchItemByName(String query) async {
    try {
      final response = await DioHeloper.getRequest(
        endPoint: ApiConstant.everyThing,
        query: {
          "apiKey": ApiConstant.apiKey,
          "q": query,
          "language": AppConstant.lang,
        },
      );
      if (response.statusCode == 200) {
        ArticlesModel articlesModel = ArticlesModel.fromJson(response.data);
        return articlesModel;
      }
    } on DioException catch (e) {
      log("dio error is: ${e.message}");
    }
    return null;
  }
}
