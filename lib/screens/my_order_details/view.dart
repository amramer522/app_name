import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/shared/items/item_my_order.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/helper_methods.dart';
import '../../gen/fonts.gen.dart';
import '../home/pages/profile/components/item_setting.dart';
import '../order_summary/view.dart';

class MyOrderDetails extends StatefulWidget {
  final String title;

  const MyOrderDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<MyOrderDetails> createState() => _MyOrderDetailsState();
}

class _MyOrderDetailsState extends State<MyOrderDetails> {
  final int _index = -2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: widget.title),
      body: SingleChildScrollView(
        padding: mainPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemMyOrder(index: 0),
            SizedBox(
              height: 35.h,
            ),
            Text("Order status",
                style: TextStyle(fontSize: 20.sp, fontFamily: FontFamily.bold)),
            SizedBox(
              height: 20.h,
            ),
            ...List.generate(
                4,
                (index) => Padding(
                  padding:  EdgeInsetsDirectional.only(start: 10.w),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 25.r,backgroundColor: Color(index<2?0xffE14B34:0xffC9C9C9),),
                              SizedBox(width: 17.w,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Order received",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.bold)),
                                    Text(index<2?"3:00PM, 20 Dec 2022":"",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular,color: const Color(0xff7B7B7B))),

                                  ],
                                ),
                              )
                            ],
                          ),
                          index == 3
                              ? const SizedBox.shrink()
                              : Container(
                                  height: 30,
                                  margin: EdgeInsetsDirectional.only(start: 24.w),
                                  width: 2.w,
                                  color: Color(index<2?0xffE14B34:0xffC9C9C9),
                                )
                        ],
                      ),
                )),
            SizedBox(
              height: 35.h,
            ),
            GestureDetector(
              onTap: () {
                navigateTo(page: const OrderSummaryScreen());
              },
              child: Container(
                height: 60.h,
                margin: EdgeInsetsDirectional.only(start: 20.w, top: 20.h, end: 20.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 5,
                        spreadRadius: 1)
                  ],
                  borderRadius: BorderRadiusDirectional.circular(6.r),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    SvgPicture.asset("assets/icons/add_to_cart.svg",color: const Color(0xff211F21),height: 19.h,width: 25.88.w,),
                    SizedBox(
                      width: 25.w,
                    ),
                    Text("Order summary",
                        style:
                        TextStyle(fontSize: 16.sp, fontFamily: FontFamily.regular)),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
