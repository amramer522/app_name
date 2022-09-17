import '/../screens/my_likes_dislikes/components/item_like_dislike.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../fake_data/fake_data.dart';

class HomeBestSellingList extends StatelessWidget {
  const HomeBestSellingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 218.h,
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 10.h),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ItemProduct(
          index: index,
          width: 152.w,
        ),
        itemCount: fakeBrandCollagesDetails.length,
        separatorBuilder: (context, index) => SizedBox(width: 20.w,),
      ),
    );
  }
}
