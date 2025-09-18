import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/styles/app_color.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/data/repo/search_result_repo.dart';
import 'package:news_app/features/screens/widgets/custom_item_card_widget.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        // toolbarHeight: 86.h,
        // leadingWidth: double.infinity,
        title: Text(
          LocaleKeys.search_results.tr(),
          style: AppTextStyles.titlesStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SearchResultRepo.searchItemByName(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.articles.length,
                    itemBuilder: (context, index) {
                      return CustomItemCardWidget(
                        article: snapshot.data!.articles[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Center(child: Text(snapshot.error.toString()));
        },
      ),
    );
  }
}
