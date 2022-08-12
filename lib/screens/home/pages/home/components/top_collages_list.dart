import 'package:app_name/shared/items/item_home_top_collages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../fake_data/fake_data.dart';

class HomeTopCollagesList extends StatelessWidget {
  const HomeTopCollagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 218.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ItemHomeTopCollages(index: index),
        itemCount: fakeBrandCollagesDetails.length,
      ),
    );
  }
}
