// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "explore": "استكشاف",
  "travel": "سفر",
  "technology": "تكنولوجيا",
  "business": "أعمال",
  "entertainment": "ترفيه",
  "cancel": "إلغاء",
  "search_results": "نتائج البحث",
  "test": "اختبار",
  "search": "بحث"
};
static const Map<String,dynamic> _en = {
  "explore": "Explore",
  "travel": "Travel",
  "technology": "Technology",
  "business": "Business",
  "entertainment": "Entertainment",
  "cancel": "Cancel",
  "search_results": "Search results",
  "test": "Test",
  "search": "search..."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
