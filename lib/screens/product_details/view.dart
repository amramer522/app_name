import '/../core/styles/styles.dart';
import '/../screens/brand_profile/view.dart';
import '/../screens/editor/view.dart';
import '/../screens/my_likes_dislikes/components/item_like_dislike.dart';
import '/../shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/helper_methods.dart';
import '../../core/styles/colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/added_to_cart_dialog.dart';
import 'item_specifications.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(
        title: "Product details",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 45.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350.h,
              margin: mainPagePadding,
              decoration: const BoxDecoration(color: Color(0xff7B7B7B)),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: mainPagePadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name",
                        style: TextStyle(
                            fontSize: 20.sp, fontFamily: FontFamily.regular),
                      ),
                      Row(
                        children: [
                          Text("LE 0.00",
                              style: TextStyle(
                                color: const Color(0xffC9C9C9),
                                fontSize: 17.sp,
                                fontFamily: FontFamily.regular,
                                decoration: TextDecoration.lineThrough,
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text("LE 0.00",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: FontFamily.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Dimension",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: FontFamily.regular,
                            color: const Color(0xff090808)),
                      ),
                      Text(
                        "230 cm * 50 cm",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: FontFamily.regular,
                            color: const Color(0xff7B7B7B)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        showAddToCartSheet(context);
                      },
                      child: Container(
                          height: 35.h,
                          width: 35.h,
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: colorSecondary),
                          child: SvgPicture.asset(
                            Assets.icons.addToCart,
                          )))
                ],
              ),
            ),
            Divider(
              color: const Color(0xffE4E4E4),
              height: 20.h,
              thickness: 5.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: mainPagePadding,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shipping to Egypt",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: FontFamily.regular,
                            color: const Color(0xff090808))),
                    Text(
                        "Free Shipping on orders over LE 0.00\nin 3-5 business days",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: FontFamily.regular,
                            color: const Color(0xff7B7B7B))),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text("Selling by ",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: FontFamily.regular,
                                color: const Color(0xff7B7B7B))),
                        GestureDetector(
                          onTap: () {
                            navigateTo(page: const BrandProfileScreen());
                          },
                          child: Text('"Brand Name"',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: FontFamily.regular,
                                  color: const Color(0xff034C65))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Divider(
              color: const Color(0xffE4E4E4),
              height: 20.h,
              thickness: 5.h,
            ),
            Padding(
              padding: mainPagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("Specifications",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: FontFamily.regular,
                          color: Colors.black)),
                  const ItemSpecifications(title: "Material", value: "Denim Jeans"),
                  const ItemSpecifications(title: "Color", value: "Blue"),
                  const ItemSpecifications(title: "Length", value: "Short Jumpsuit"),
                  const ItemSpecifications(title: "Fit", value: "Regular"),
                  const ItemSpecifications(title: "Occasion", value: "Casual"),
                  const ItemSpecifications(
                      title: "Care Instructions", value: "Machine wash"),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
            Divider(
              color: const Color(0xffE4E4E4),
              height: 20.h,
              thickness: 5.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: mainPagePadding,
              child: Text("Similar Products",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: FontFamily.regular,
                      color: const Color(0xff090808))),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 266.h,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w,bottom: 30.h),
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ItemProduct(index: index, width: 167.w),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.w,
                  ),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: Size(321.w, 45.h)),
        onPressed: () {
          navigateTo(page: const EditorScreen());
        },
        child: const Text("Add to Editor"),
      ),
    );
  }
}
