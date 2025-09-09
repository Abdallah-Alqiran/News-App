import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_color.dart';

class CustormTopHeadLine extends StatelessWidget {
  const CustormTopHeadLine({super.key, required this.name, required this.onTap});

  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20.sp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.sp),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.sp),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColor.appBarColor, width: 2.0),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Center(child: Text(name)),
        ),
      ),
    );
  }
}
