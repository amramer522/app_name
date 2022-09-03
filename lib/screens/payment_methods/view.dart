import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/screens/checkout/view.dart';
import 'package:app_name/shared/app_input.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  bool isCash = true;
  bool isSaveSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: "Payment methods"),
      body: SingleChildScrollView(
        padding: mainPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35.h,
            ),
            Text("Choose\nA payment method",
                style: TextStyle(
                    fontSize: 28.sp,
                    fontFamily: FontFamily.bold,
                    color: const Color(0xff2F1F2B))),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      isCash = true;
                      setState(() {});
                    },
                    child: Container(
                      height: 40.h,
                      child: Center(
                        child: Text("Cash on delivery",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: FontFamily.bold,
                                height: 2.5.h,
                                color: isCash ? Colors.white : Colors.black)),
                      ),
                      decoration: BoxDecoration(
                          color:
                              !isCash ? const Color(0xffEBEBEB) : Colors.black,
                          borderRadius: BorderRadius.circular(6.r)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      isCash = false;
                      setState(() {});
                    },
                    child: Container(
                      height: 40.h,
                      child: Center(
                        child: Text("Credit/debit card",
                            style: TextStyle(
                                fontSize: 14.sp,
                                height: 2.5.h,
                                fontFamily: FontFamily.bold,
                                color: !isCash ? Colors.white : Colors.black)),
                      ),
                      decoration: BoxDecoration(
                          color:
                              isCash ? const Color(0xffEBEBEB) : Colors.black,
                          borderRadius: BorderRadius.circular(6.r)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/${isCash ? "cash" : "credit_card"}.svg",
                  width: 35.w,
                  height: 20.h,
                ),
                SizedBox(
                  width: 21.w,
                ),
                Text(isCash ? "Cash on delivery" : "Credit/debit card",
                    style: TextStyle(
                        fontSize: 20.sp, fontFamily: FontFamily.bold)),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            isCash
                ? Text(
                    "With this option you will pay full amount after we deliver your order to your address")
                : const SizedBox.shrink(),
            isCash
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppInput(
                        label: "Card number",
                        hint: "oooo " * 4,
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontFamily: FontFamily.regular),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: AppInput(
                              label: "Expiry date",
                              hint: "MM/YY",
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontFamily: FontFamily.regular),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: AppInput(
                              label: "CVV",
                              hint: "...",
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontFamily: FontFamily.regular),
                            ),
                          )
                        ],
                      ),
                      AppInput(
                        label: "Cardholder name",
                        hint: "Enter full name",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontFamily: FontFamily.regular),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          isSaveSelected = !isSaveSelected;
                          setState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 25.h,
                              width: 22.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffC9C9C9)),
                                  borderRadius: BorderRadius.circular(4.r)),
                              child: Center(
                                  child: isSaveSelected
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.black,
                                          size: 16.h,
                                        )
                                      : const SizedBox.shrink()),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("Save card",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: FontFamily.regular)),
                          ],
                        ),
                      )
                    ],
                  )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        child: ElevatedButton(
            onPressed: () {
              navigateTo(page: const CheckOutScreen());
            },
            style: ElevatedButton.styleFrom(
                primary: colorPrimary, fixedSize: Size(350.w, 50.h)),
            child: Text(isCash ? "Continue" : "Add card")),
      ),
    );
  }
}
