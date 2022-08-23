import 'package:app_name/fake_data/fake_data.dart';
import 'package:app_name/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemHomeTopCollages extends StatelessWidget {
  final int index;

  const ItemHomeTopCollages({Key? key, required this.index}) : super(key: key);

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
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Image.network(
                        fakeBrandCollagesDetails[index]["image"].toString()),
                    index==1||index==3?Container(
                      height: 28.h,
                      width: 52.w,
                      child: Center(
                          child: Text("-25%",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontFamily: FontFamily.regular))),
                      decoration: BoxDecoration(
                          color: Color(0xffE14B34),
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10.r),
                            bottomEnd: Radius.circular(10.r),
                          )),
                    ):const SizedBox.shrink()
                  ],
                )),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            fakeBrandCollagesDetails[index]["collage_name"].toString(),
            style: TextStyle(fontSize: 18.sp, fontFamily: FontFamily.bold),
          ),
          Text(
            "29.00 EGP",
            style: TextStyle(fontSize: 16.sp, fontFamily: FontFamily.bold),
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
