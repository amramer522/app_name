// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "finish": "انهاء",
  "getStarted": "هيا نبدأ",
  "skip": "تخطى",
  "appName": "اسم التطبيق",
  "next": "التالى",
  "noConnection": "لا يوجد اتصال ب الانترنت",
  "boorConnection": "الانترنت ضعيف",
  "serverError": "مشكلة بالسيرفر حاول مره اخرى"
};
static const Map<String,dynamic> en = {
  "appName": "App Name",
  "next": "Next",
  "skip": "Skip",
  "finish": "Finish",
  "getStarted": "Get Started",
  "noConnection": "No Internet Connection",
  "boorConnection": "Poor Internet",
  "serverError": "Server Error try again later"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
