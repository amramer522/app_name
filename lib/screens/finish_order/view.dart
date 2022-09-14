import 'dart:async';

import 'package:app_name/screens/my_orders/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/helper_methods.dart';
import '../../gen/fonts.gen.dart';
import '../home/view.dart';

class FinishOrderScreen extends StatefulWidget {
  const FinishOrderScreen({Key? key}) : super(key: key);

  @override
  State<FinishOrderScreen> createState() => _FinishOrderScreenState();
}

class _FinishOrderScreenState extends State<FinishOrderScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 2), () {
    //   navigateTo(page: HomeScreen(), leaveHistory: false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3,),
            SvgPicture.asset(
              "assets/icons/finish_order.svg",
              height: 111.h,
              width: 111.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text("Congrats!",
                style: TextStyle(
                    fontSize: 40.sp,
                    height: 1.1.h,
                    decoration: TextDecoration.none,
                    fontFamily: FontFamily.extraBold,
                    color: Colors.black)),
            SizedBox(
              height: 5.h,
            ),
            Text("Your order was placed successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.sp,
                    height: 1.1.h,
                    decoration: TextDecoration.none,
                    fontFamily: FontFamily.regular,
                    color: Colors.black)),
           const Spacer(flex: 2,),
            Text("Click here to check your order status",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.sp,
                    height: 1.1.h,
                    decoration: TextDecoration.none,
                    fontFamily: FontFamily.regular,
                    color: Colors.black)),
            SizedBox(
              height: 17.h,
            ),
            ElevatedButton(onPressed: (){
              navigateTo(page: MyOrdersScreen(isFormOrderSuccess: true,));
            }, child: Text("Check my order")),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}
