import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';

class CustomCarosilWidget extends StatelessWidget {
  const CustomCarosilWidget({
    super.key,
    this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  final String? imageUrl;
  final String title;
  final String subTitle;

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
                height: 190.h,
                width: MediaQuery.sizeOf(context).width,
                imageUrl:
                    imageUrl ??
                    'https://drive.google.com/uc?export=view&id=1G5BpqWfAL4X9tynWcj_vh8N4KuDT80Vs',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget:
                    (context, url, error) =>
                        const Icon(Icons.error, color: Colors.red),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            subTitle,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
