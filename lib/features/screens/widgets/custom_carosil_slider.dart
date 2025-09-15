import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';

class CustomCarosilWidget extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String date;
  final String authorName;

  const CustomCarosilWidget({
    super.key,
    required this.title,
    required this.date,
    required this.authorName,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox(
              child: CachedNetworkImage(
                height: 206.h,
                width: MediaQuery.sizeOf(context).width,
                imageUrl:
                    imageUrl ??
                    'https://thumbs.dreamstime.com/b/no-photo-thumbnail-graphic-element-no-found-available-image-gallery-album-flat-picture-placeholder-symbol-vector-no-317104797.jpg',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            title,
            style: AppTextStyles.titlesStyle,
          ),
          SizedBox(height: 8.h),
          Text(
            "$authorName - $date",
            style: AppTextStyles.subtitleStyle,
          ),
        ],
      ),
    );
  }
}
