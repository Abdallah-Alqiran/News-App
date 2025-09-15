import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';

class CustomItemCardWidget extends StatelessWidget {
  const CustomItemCardWidget({super.key, required this.imageUrl, required this.title, required this.author, required this.date});

  final String imageUrl;
  final String title;
  final String author;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Text(title, style: AppTextStyles.titlesStyle,maxLines: 2, overflow: TextOverflow.ellipsis,),
                SizedBox(height: 5.h),
                Text("$author - $date", style: AppTextStyles.subtitleStyle,),
              ],
            ),
          ),

          CachedNetworkImage(
            width: 112.w,
            height: 80.h,
            imageUrl:
                imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget:
                (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
