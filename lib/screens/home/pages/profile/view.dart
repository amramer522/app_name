import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/styles.dart';
import '../../../../fake_data/fake_data.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../shared/second_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: "My Profile"),
      body: Container(
        width: double.infinity,
        padding: mainPagePadding,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full Name",style: TextStyle(fontSize: 30.sp,fontFamily: FontFamily.extraBold)),
                      Text("amramer522@gmail.com",style: TextStyle(fontSize: 14.sp,fontFamily: FontFamily.regular,color: Color(0xff7B7B7B))),
                    ],
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                            fakeBrandCollagesDetails[0]["image"].toString(),fit: BoxFit.fill,)),
                    Container(
                      height: 27.h,
                      width: 27.h,
                      decoration: BoxDecoration(
                        color: Color(0xffE14B34),
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: IconButton(
                            icon: Icon(Icons.edit,size: 13.sp,), onPressed: () {}),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
