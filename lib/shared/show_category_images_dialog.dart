import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'items/categories_items_swiper.dart';

showCategoryImagesDialog(context) {
  showDialog(
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
        child: const CategoriesItemsSwiper(),
      ),
      context: context);

}
