import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/fake_data/fake_data.dart';
import 'package:app_name/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/styles/colors.dart';
import '../gen/fonts.gen.dart';
import 'fileter_dialog.dart';

showCategoryImagesDialog(context) {
  showDialog(
      builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 11.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.close,color: Colors.white,)),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 11.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.r)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 16.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                showFilterDialog(context);
                              },
                              child: SvgPicture.asset(
                                Assets.icons.filter,
                                height: 20.h,
                                width: 20.h,
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text("678 Found Results",style: TextStyle(fontSize: 12.sp,fontFamily: FontFamily.regular,color: colorPrimary))
                          ],
                        ),
                        const Divider(),
                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        "https://www.cips.org/supply-management-jobs/getasset/63f90cc8-0778-4023-80b9-85246ce586b0/",
                                    height: 350.h,
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(bottom: 20.h),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(3, (index) => Container(
                                        width: 34.w,
                                        height: 3.h,
                                        margin: EdgeInsetsDirectional.only(start: 5.w),
                                        decoration: BoxDecoration(
                                          color: index==0?Colors.black:Colors.grey,
                                          borderRadius: BorderRadius.circular(25.r)
                                        ),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                              Text("Product Name",style: TextStyle(fontSize: 20.sp,fontFamily: FontFamily.regular),),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Text("LE 0.00",
                                      style: TextStyle(
                                          color: const Color(0xffC9C9C9),
                                          fontSize: 17.sp,fontFamily: FontFamily.regular,
                                          decoration: TextDecoration.lineThrough,
                                      )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text("LE 0.00",style: TextStyle(fontSize: 20.sp,fontFamily: FontFamily.bold)),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          height: 35.h,
                                          width: 35.h,
                                          padding: EdgeInsets.all(8.r),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7.r),
                                              color: colorSecondary),
                                          child: SvgPicture.asset(
                                            Assets.icons.addToCart,
                                          )))
                                ],
                              ),
                              Text("Size",
                                  style: TextStyle(
                                      fontSize: 17.sp, fontFamily: FontFamily.bold)),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 34.h,
                                child: ListView.separated(
                                  itemBuilder: (context, index) => Container(
                                    width: 66.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffE6E6E6),
                                        borderRadius: BorderRadius.circular(3.r)),
                                    child: const Center(child: Text("UK 10")),
                                  ),
                                  separatorBuilder: (context, index) => SizedBox(
                                    width: 10.w,
                                  ),
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("Add to Editor"),
                              ),
                              SizedBox(height: 8.h,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.08),
                                  borderRadius: BorderRadius.circular(7.r)
                                ),
                                child: TextButton.icon(
                                  onPressed: () {},
                                  label: Text("Previous",style: TextStyle(color:Colors.black,fontSize: 16.sp,fontFamily: FontFamily.regular)),
                                  icon: SvgPicture.asset("assets/icons/reload.svg"),
                                ),
                              ),
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      context: context);
}
