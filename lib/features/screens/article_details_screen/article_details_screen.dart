import 'package:flutter/material.dart';
import 'package:news_app/features/data/model/dio_helper_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final ArticleModel article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}