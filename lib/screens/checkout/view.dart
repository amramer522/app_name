import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/screens/home/pages/cart/components/item_cart_free.dart';
import 'package:app_name/shared/items/item_my_order.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/finish_order_dialog.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: "Chechout"),
      body: SingleChildScrollView(
        padding: mainPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
                3,
                (index) => Column(
                      children: [
                        ItemCartFree(index: index, isFree: false),
                        Divider(indent: 100.w, thickness: 1.5.h)
                      ],
                    )),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Text(
                "Delivered to",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: FontFamily.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const ItemMyOrder(index: 0),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
              child: Text(
                "Paid by",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: FontFamily.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/credit_card.svg",
                  width: 35.w,
                  height: 20.h,
                ),
                SizedBox(
                  width: 21.w,
                ),
                Text("Credit/debit card",
                    style: TextStyle(
                        fontSize: 20.sp, fontFamily: FontFamily.bold)),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Text(
                "Voucher",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: FontFamily.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(flex: 4,child: SizedBox(height: 45.h,child: TextFormField())),
                SizedBox(width: 16.w,),
                Expanded(child: ElevatedButton(onPressed: () {}, child: const Text("Apply")))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h,bottom: 20.h),
              child: Text(
                "Bill breakdown",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: FontFamily.bold,
                  color: Colors.black,
                ),
              ),
            ),
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
            SizedBox(height: 20.h,),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 32.w,vertical: 16.h),
        child: ElevatedButton(
            onPressed: () {
              finishOrderDialog(context);
            },
            style: ElevatedButton.styleFrom(
                primary: colorPrimary, fixedSize: Size(350.w, 50.h)),
            child: const Text("Confirm order")),
      ),
    );
  }
}
