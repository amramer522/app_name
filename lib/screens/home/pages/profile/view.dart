import '/../screens/login/view.dart';
import '/../screens/my_orders/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/helper_methods.dart';
import '../../../../core/styles/styles.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../shared/icon_notifications.dart';
import '../../../../shared/second_app_bar.dart';
import '../../../brand_proucts/view.dart';
import '../../../collages/view.dart';
import '../../../edit_profile/view.dart';
import '../../../my_addresses/view.dart';
import 'components/item_profile.dart';
import 'components/item_setting.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SecondAppBar(title: "My Profile", haveBack: false,
          actions: [
        ItemNotifications(),
      ]
      ),
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
                  GestureDetector(
                    onTap: () {
                      navigateTo(page: const EditProfileScreen());
                    },
                    child: Stack(
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
                            child: SvgPicture.asset(
                              "assets/icons/edit_pin.svg",
                              height: 13.h,
                              width: 13.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const ItemProfile(
                title: "My Collages",
                numberOfItems: 10,
                page: CollagesScreen(
                  title: "My Collages",
                  withFilter: true,
                )),
            const ItemProfile(
                title: "My Likes",
                numberOfItems: 5,
                page: BrandProductScreen(
                  title: "My Likes",
                )),
            const ItemProfile(
                title: "My Dislikes",
                numberOfItems: 100,
                page: BrandProductScreen(
                  title: "My Dislikes",
                ),
                // page: MyLikesAndDisLikesScreen(
                //   title: "My Dislikes",
                // )
            ),
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
                      TextStyle(fontSize: 22.sp, fontFamily: FontFamily.bold)),
            ),
            const ItemSetting(
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
              title: CacheHelper.getUserToken().trim().isEmpty
                  ? "Login"
                  : "Logout",
              image: "assets/icons/logout.svg",
              isLogout: CacheHelper.getUserToken().trim().isNotEmpty,
              page: CacheHelper.getUserToken().trim().isEmpty
                  ? const LoginScreen()
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
