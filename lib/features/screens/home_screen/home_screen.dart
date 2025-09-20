import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/constant/app_constant.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styles/app_color.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/screens/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/screens/home_screen/cubit/home_state.dart';
import 'package:news_app/features/screens/home_screen/widgets/search_text_field_widget.dart';
import 'package:news_app/features/screens/widgets/custom_carosil_slider.dart';
import 'package:news_app/features/screens/widgets/custom_item_card_widget.dart';
import 'package:news_app/features/screens/widgets/custom_top_headline_widget.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _changeLanguage() {
    if (context.locale == const Locale('en')) {
      context.setLocale(const Locale('ar'));
      AppConstant.lang = "ar";
    } else {
      context.setLocale(const Locale('en'));
      AppConstant.lang = "en";
    }
    log("Language: ${AppConstant.lang}");
  }

  @override
  Widget build(BuildContext context) {

    context.read<HomeCubit>().getTopHeadline();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        toolbarHeight: 86.h,
        leadingWidth: double.infinity,
        title: Text(LocaleKeys.explore.tr(), style: AppTextStyles.titlesStyle),
        actions: [SearchTextFieldWidget()],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,

        child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
          } else if (state is SucessState) {
            final snapshot = (state).topHeadLineModel;
            return Column(
                children: [
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 32.h,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustormTopHeadLine(
                          name: LocaleKeys.explore.tr(),
                          onTap: () => GoRouter.of(context).pushNamed(
                            AppRoutes.searchResultScreen,
                            extra: "explore",
                          ),
                        ),
                        CustormTopHeadLine(
                          name: LocaleKeys.travel.tr(),
                          onTap: () => GoRouter.of(context).pushNamed(
                            AppRoutes.searchResultScreen,
                            extra: "travel",
                          ),
                        ),
                        CustormTopHeadLine(
                          name: LocaleKeys.technology.tr(),
                          onTap: () => GoRouter.of(context).pushNamed(
                            AppRoutes.searchResultScreen,
                            extra: "technology",
                          ),
                        ),
                        CustormTopHeadLine(
                          name: LocaleKeys.business.tr(),
                          onTap: () => GoRouter.of(context).pushNamed(
                            AppRoutes.searchResultScreen,
                            extra: "business",
                          ),
                        ),
                        CustormTopHeadLine(
                          name: LocaleKeys.entertainment.tr(),
                          onTap: () => GoRouter.of(context).pushNamed(
                            AppRoutes.searchResultScreen,
                            extra: "entertainment",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  if (snapshot.articles.isNotEmpty) ...[
                    CustomCarosilWidget(
                      title: snapshot.articles[0].title ?? "",
                      authorName: snapshot.articles[0].author ?? "",
                      date: snapshot.articles[0].publishedAt ?? "",
                      imageUrl:
                          snapshot.articles[0].urlToImage ??
                          'https://picsum.photos/400',
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.articles.length,
                        itemBuilder: (context, index) {
                          return CustomItemCardWidget(
                            article: snapshot.articles[index],
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    const Center(child: Text("لا توجد بيانات")),
                  ],
                ],
              );
          } else if (state is ErrorState) {
            return Text(state.error);
          }
          return Text("Something went wrong");
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeLanguage,
        backgroundColor: AppColor.appBarColor,
        child: Icon(Icons.language),
      ),
    );
  }
}
