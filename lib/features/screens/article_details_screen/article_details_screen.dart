import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/data/model/dio_helper_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final ArticleModel article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: 430.w,
              height: 316.h,
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? 'https://picsum.photos/400',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 250.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(24.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title ?? "No title found",
                          style: AppTextStyles.titlesStyle,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "${article.author} - ${article.publishedAt}",
                          style: AppTextStyles.subtitleStyle,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "${article.description}",
                          style: AppTextStyles.black14Normal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
