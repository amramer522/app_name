import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/screens/brand_photos/view.dart';
import 'package:app_name/screens/brand_profile/components/item_social.dart';
import 'package:app_name/screens/brand_proucts/view.dart';
import 'package:app_name/screens/collages/view.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/fonts.gen.dart';
import '../home/pages/home/components/top_collages_items_card.dart';

class BrandProfileScreen extends StatelessWidget {
  const BrandProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: "Brand  Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Padding(
             padding: mainPagePadding,
             child: Column(
               children: [
                 ListTile(
                   leading: CircleAvatar(
                     radius: 26.r,
                   ),
                   title: const Text("Brand Name"),
                   subtitle: const Text("About brand experience"),
                 ),
                 SizedBox(
                   height: 19.h,
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                   decoration: BoxDecoration(
                       border:
                       Border.all(color: const Color(0xffD1D9E6), width: .5.h)),
                   child: Row(
                     children: [
                       SvgPicture.asset("assets/icons/location.svg"),
                       SizedBox(
                         width: 11.w,
                       ),
                       Text("Cairo, Nasr city ")
                     ],
                   ),
                 ),
                 Row(
                   children: [
                     ItemSocial(image: "whats_app"),
                     ItemSocial(image: "instgram"),
                     ItemSocial(image: "facebook")
                   ],
                 ),
               ],
             ),
           ),
            SizedBox(height: 20.h,),
            Image.network(
              "https://media.istockphoto.com/vectors/summer-big-sale-banner-on-geometric-background-vector-id1227201480?k=20&m=1227201480&s=612x612&w=0&h=x4N4ND0VZxqZ3E5lIKPT0cUtwhD6qbmVl7zePyvDgFc=",
              height: 139.w,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
           Padding(
             padding: mainPagePadding,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 20.h,),
                 Text("Explore",style: TextStyle(fontSize: 20.sp,fontFamily: FontFamily.regular)),
                 SizedBox(height: 10.h,),
                 TopCollagesItemsCard(title: "Collages",numberOfItems: 10,onPress: (){
                   navigateTo(page: CollagesScreen(title: "Brand Collages", withFilter: true));
                 }),
                 SizedBox(height: 10.h,),
                 TopCollagesItemsCard(title: "Products",numberOfItems: 40,onPress: (){
                   navigateTo(page: BrandProductScreen(title: "Brand Products"));
                 }),
                 SizedBox(height: 10.h,),
                 TopCollagesItemsCard(title: "Photos",numberOfItems: 20,onPress: (){
                   navigateTo(page: BrandPhotosScreen());
                 }),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
