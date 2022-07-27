import 'package:flutter/cupertino.dart';

import '../../gen/assets.gen.dart';

class OnBoardingController {
  var images = [Assets.images.onboarding.onBoarding1.path, Assets.images.onboarding.onBoarding2.path, Assets.images.onboarding.onBoarding3.path];
  var titles = ["Title", "Title", "Title"];
  var hints = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ut sapien ut arcu ullamcorper mattis et eu orci.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ut sapien ut arcu ullamcorper mattis et eu orci.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ut sapien ut arcu ullamcorper mattis et eu orci."
  ];

  int currentIndex = 0;

  changePage(value) {
    currentIndex = value;
  }

}
