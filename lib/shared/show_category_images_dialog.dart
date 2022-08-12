import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/fake_data/fake_data.dart';
import 'package:app_name/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/styles/colors.dart';
import '../gen/fonts.gen.dart';

showCategoryImagesDialog(context) {
  showDialog(
      builder: (context) => SimpleDialog(
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.icons.filter),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text("678 Found Results")
                ],
              ),
              Divider(),
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "https://www.cips.org/supply-management-jobs/getasset/63f90cc8-0778-4023-80b9-85246ce586b0/",
                    height: 350.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product Name"),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          Text("LE 0.00",style: TextStyle(color: Color(0xffC9C9C9),decoration: TextDecoration.lineThrough)),
                          SizedBox(width: 10.w,),
                          Text("LE 0.00"),
                        ],
                      ),
                      SizedBox(height: 16.h,),
                      Text("Size",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.bold)),
                      SizedBox(height: 10.h,),
                      Container(
                        height: 34.h,
                        width: 66.w,
                        decoration: BoxDecoration(
                            color: Color(0xffE6E6E6),
                            borderRadius: BorderRadius.circular(3.r)
                        ),
                        child: Center(child: Text("UK 10")),
                      ),
                      ElevatedButton(onPressed: (){}, child: Text("Add to Editor"),style: ElevatedButton.styleFrom(
                          fixedSize: Size(275.w,45.h)
                      ),)
                    ],
                  ),

                  const Spacer(),
                  GestureDetector(
                      onTap: () {},
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
              )
              // Container(
              //   height: 708.h,
              //   width: double.infinity,
              //   decoration: BoxDecoration(color: Colors.white),
              //   child: Column(
              //     children: [
              //
              //     ],
              //   ),
              // )
            ] ,
          ),
      context: context);
}
