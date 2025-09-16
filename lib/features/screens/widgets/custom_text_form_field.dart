import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  const CustomTextFormField({super.key, required this.hintText, required this.controller, this.maxLines = 1, this.keyboardType = TextInputType.text, required this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: (text) {
          if (text!.isEmpty) {
            return 'You should add text';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColor.secondaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}