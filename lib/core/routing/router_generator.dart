import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/data/model/dio_helper_model.dart';
import 'package:news_app/features/screens/article_details_screen/article_details_screen.dart';
import 'package:news_app/features/screens/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/screens/home_screen/home_screen.dart';
import 'package:news_app/features/screens/search_result_screen/search_result_screen.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(),
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (context, state) => Container(),
      ),
      GoRoute(
        path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (context, state) {
          String query = state.extra as String;
          return SearchResultScreen(query: query);
        },
      ),
      GoRoute(
        path: AppRoutes.articleDetailsScreen,
        name: AppRoutes.articleDetailsScreen,
        builder: (context, state) {
          ArticleModel article = state.extra as ArticleModel;
          return ArticleDetailsScreen(article: article);
        },
      ),
    ],
  );
}
