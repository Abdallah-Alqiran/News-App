import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/data/model/dio_helper_model.dart';

class CustomItemCardWidget extends StatelessWidget {
  const CustomItemCardWidget({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.articleDetailsScreen, extra: article);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? "No title found",
                    style: AppTextStyles.titlesStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "${article.author} - ${article.publishedAt}",
                    style: AppTextStyles.subtitleStyle,
                  ),
                ],
              ),
            ),

            CachedNetworkImage(
              width: 112.w,
              height: 80.h,
              imageUrl: article.urlToImage ?? 'https://picsum.photos/400',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
