import 'package:app_name/screens/my_orders/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/styles.dart';
import '../../../../fake_data/fake_data.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../shared/second_app_bar.dart';
import '../../../collages/view.dart';
import '../../../my_addresses/view.dart';
import '../../../my_likes_dislikes/view.dart';
import 'components/item_profile.dart';
import 'components/item_setting.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SecondAppBar(title: "My Profile",haveBack: false, actions: [
        GestureDetector(
            onTap: () {},
            child: Container(
                height: 33.h,
                width: 33.w,
                padding: EdgeInsets.all(6.r),
                child: SvgPicture.asset("assets/icons/notifications.svg")))
      ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xffEEEEEE),
              padding: mainPagePadding.copyWith(top: 15.h, bottom: 15.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Full Name",
                            style: TextStyle(
                                fontSize: 30.sp,
                                fontFamily: FontFamily.extraBold)),
                        Text("amramer522@gmail.com",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: FontFamily.regular,
                                color: const Color(0xff7B7B7B))),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 35.r,
                        backgroundImage: const NetworkImage(
                            "https://www.incimages.com/uploaded_files/image/1920x1080/getty_481292845_77896.jpg"),
                      ),
                      Container(
                        height: 27.h,
                        width: 27.h,
                        decoration: const BoxDecoration(
                            color: Color(0xffE14B34), shape: BoxShape.circle),
                        child: Center(
                          child: GestureDetector(
                              child: SvgPicture.asset(
                                "assets/icons/edit_pin.svg",
                                height: 13.h,
                                width: 13.h,
                              ),
                              onTap: () {}),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            ItemProfile(
                title: "My Collages",
                numberOfItems: 10,
                page: CollagesScreen(
                  title: "My Collages",
                  withFilter: true,
                )),
            ItemProfile(
                title: "My Likes",
                numberOfItems: 5,
                page: MyLikesAndDisLikesScreen(title: "My Likes",)),
            ItemProfile(
                title: "My Dislikes",
                numberOfItems: 100,
                page: MyLikesAndDisLikesScreen(
                  title: "My Dislikes",
                )),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              thickness: 6,
              color: Color(0xffEEEEEE),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text("Settings",
                  style:
                      TextStyle(fontSize: 17.sp, fontFamily: FontFamily.bold)),
            ),
            ItemSetting(
              title: "My orders",
              image: "assets/icons/my_orders.svg",
              page: MyOrdersScreen(),
            ),
            ItemSetting(
              title: "Saved addresses",
              image: "assets/icons/saved_addresses.svg",
              page: MyAddressesScreen(),
            ),
            ItemSetting(
              title: "Logout",
              image: "assets/icons/logout.svg",
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }
}
