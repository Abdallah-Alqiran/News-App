import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemCardWidget extends StatelessWidget {
  const CustomItemCardWidget({super.key, this.imageUrl, required this.title, required this.subTitle});

  final String? imageUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                SizedBox(height: 5.h),
                Text(subTitle),
              ],
            ),
          ),

          CachedNetworkImage(
            width: 100.w,
            height: 100.h,
            imageUrl:
                imageUrl ??
                'https://picsum.photos/400',
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
