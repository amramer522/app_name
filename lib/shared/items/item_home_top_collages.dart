import '/../core/helper_methods.dart';
import '/../core/styles/styles.dart';
import '/../fake_data/fake_data.dart';
import '/../gen/fonts.gen.dart';
import '/../screens/collage_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemHomeTopCollages extends StatelessWidget {
  final int index;

  const ItemHomeTopCollages({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(page: const CollageDetailsScreen());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: shadowOfItem()),
        width: 152.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Image.network(
                          fakeBrandCollagesDetails[index]["image"].toString()),
                      index == 1 || index == 3
                          ? Container(
                              height: 28.h,
                              width: 52.w,
                              child: Center(
                                  child: Text("-25%",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontFamily: FontFamily.regular))),
                              decoration: BoxDecoration(
                                  color: const Color(0xffE14B34),
                                  borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(10.r),
                                    bottomEnd: Radius.circular(10.r),
                                  )),
                            )
                          : const SizedBox.shrink()
                    ],
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: mainPagePadding,
              child: Text(
                fakeBrandCollagesDetails[index]["collage_name"].toString(),
                style: TextStyle(fontSize: 18.sp, fontFamily: FontFamily.bold),
              ),
            ),
            Padding(
              padding: mainPagePadding,
              child: Row(
                children: [
                  Text("EGP",style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.regular)),
                  SizedBox(width: 5.w,),
                  Text("29.00",style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.bold)),
                  SizedBox(width: 10.w,),
                  Text("35.00",style: TextStyle(fontSize: 13.sp,decoration: TextDecoration.lineThrough,decorationThickness: 20.h,fontFamily: FontFamily.bold)),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
