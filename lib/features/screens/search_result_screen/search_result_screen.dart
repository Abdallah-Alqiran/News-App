import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/styles/app_color.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/data/repo/search_result_repo.dart';
import 'package:news_app/features/screens/search_result_screen/cubit/search_result_cubit.dart';
import 'package:news_app/features/screens/search_result_screen/cubit/search_result_state.dart';
import 'package:news_app/features/screens/widgets/custom_item_card_widget.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    context.read<SearchResultCubit>().getSearchItemByName(query);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text(
          LocaleKeys.search_results.tr(),
          style: AppTextStyles.titlesStyle,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SearchResultCubit, SearchResultState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(child: Text(state.error.toString()));
          } else if (state is SucessState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.searchModel.articles.length,
                    itemBuilder: (context, index) {
                      return CustomItemCardWidget(
                        article: state.searchModel.articles[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return Text("Unexpected Error");
        },
      ),
    );
  }
}
