import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/styles/app_color.dart';

class AppTextStyles {
  static TextStyle titlesStyle = GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Color(0xFF231F20));
  static TextStyle subtitleStyle = GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Color(0xFF6D6265));
  static TextStyle onBoardingDescriptionStyle = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColor.whiteColor);
  static TextStyle foodTitle = GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.black);

  static TextStyle white14SemiBold = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColor.whiteColor);
  static TextStyle black14Normal = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColor.blackColor);
  static TextStyle grey14Regular = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColor.blackColor);
}