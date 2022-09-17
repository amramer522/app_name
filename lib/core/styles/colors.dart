import 'package:flutter/material.dart';

const colorPrimary = Color(0xff000000);
const colorSecondary = Color(0xffE14B34);
var colorGreyForShimmerItem = Colors.grey.withOpacity(.2);
var colorBaseShimmer = colorPrimary.withOpacity(.6);
var colorHighlightColorShimmer = colorPrimary.withOpacity(.8);


MaterialColor buildMaterialColor(Color color) {
  List strengths = [.05, .1, .2, .3, .4, .5, .6, .7, .8, .9];
  final int r = color.red, g = color.green, b = color.blue;
  Map<int, Color> swatch = {};
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}