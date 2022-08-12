import 'package:app_name/fake_data/fake_data.dart';
import 'package:app_name/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemHomeTopCollages extends StatelessWidget {
  final int index;
  const ItemHomeTopCollages({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 218.h,
      width: 152.w,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                    fakeBrandCollagesDetails[index]["image"].toString())),
          ),
          SizedBox(height: 15.h,),
          Text(
            fakeBrandCollagesDetails[index]["collage_name"].toString(),
            style: TextStyle(fontSize: 18.sp, fontFamily: FontFamily.bold),
          ),
          Text(
            "29.00 EGP",
            style: TextStyle(fontSize: 16.sp, fontFamily: FontFamily.bold),
          ),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}
