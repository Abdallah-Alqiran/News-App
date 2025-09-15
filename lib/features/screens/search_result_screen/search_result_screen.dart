import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_color.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        toolbarHeight: 86.h,
        leadingWidth: double.infinity,
        title: Text(
          LocaleKeys.search_results.tr(),
          style: AppTextStyles.titlesStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(query)
        ],
      ),
    );
  }
}
