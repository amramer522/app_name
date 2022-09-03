import 'package:app_name/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/fonts.gen.dart';
import '../../shared/second_app_bar.dart';
import '../home/pages/cart/components/item_cart_free.dart';
import '../my_addresses/components/item_my_address.dart';
class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: "Order summary"),
      body: SingleChildScrollView(
        padding: mainPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text(
                "Order Items",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ...List.generate(3, (index) =>
                Column(
                  children: [
                    ItemCartFree(index: index,isFree: false),
                    Divider(indent: 100.w, thickness: 1.5.h)
                  ],
                )),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 20.h),
              child: Text("Order Address",style:  Theme.of(context).textTheme.bodyText1),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              child: Text("Khalid Ibn Elwalid st 9th street,Old Maadi, Cairo",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: FontFamily.regular,
                      color: const Color(0xff7B7B7B))),
            ),
            // ItemMyAddress(),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 20.h),
              child: Text("Paid by",style:  Theme.of(context).textTheme.bodyText1),
            ),

            Container(
              // padding: EdgeInsets.all(4.r),
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: const Color(0xffEEEEEE)
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/credit_card_grey.svg",
                    width: 50.w,
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 21.w,
                  ),
                  Text("Credit/debit card",
                      style: TextStyle(
                          fontSize: 16.sp, fontFamily: FontFamily.bold)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 20.h),
              child: Text("Voucher",style:  Theme.of(context).textTheme.bodyText1),
            ),

            Container(
              padding: EdgeInsets.all(16.r),
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  color: const Color(0xffEEEEEE)
              ),
              child: Text("ABC123",
                  style: TextStyle(
                      fontSize: 18.sp,color: const Color(0xff7B7B7B), fontFamily: FontFamily.regular)),
            ),

            Padding(
              padding: EdgeInsetsDirectional.only(top: 20.h),
              child: Text("Bill Breakdown",style:  Theme.of(context).textTheme.bodyText1),
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Text("Subtotal",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular)),
                const Spacer(),
                Text("LE 0,00",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular)),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Text("Shipping Fees",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular)),
                const Spacer(),
                Text("LE 0,00",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular)),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Text("VAT",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular)),
                const Spacer(),
                Text("LE 0,00",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular)),
              ],
            ),
            Divider(thickness: 1.5.h),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Text("Total Fees",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.bold)),
                const Spacer(),
                Text("LE 0,00",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.bold)),
              ],
            ),
            SizedBox(height: 40.h,),
          ],
        ),
      ),
    );
  }
}
