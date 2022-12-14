import '/../core/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/styles.dart';
import '../../fake_data/fake_data.dart';
import '../../gen/fonts.gen.dart';
import '../../screens/my_order_details/view.dart';

class ItemMyOrder extends StatelessWidget {
  final int index;

  const ItemMyOrder({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(page: const MyOrderDetails());
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        decoration: BoxDecoration(
          boxShadow: shadowOfItem(),
          borderRadius: BorderRadiusDirectional.circular(6.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order #${fakeMyOrders[index]["id"]}",
                  style: TextStyle(
                      fontSize: 17.sp,
                      height: 2.h,
                      decoration: TextDecoration.underline,
                      decorationThickness: 30.h,
                      fontFamily: FontFamily.bold)),
              Text(
                  "${fakeMyOrders[index]["date"]}   ${fakeMyOrders[index]["time"]}",
                  style: TextStyle(
                      fontSize: 17.sp,
                      height: 2.h,
                      fontFamily: FontFamily.regular,
                      color: const Color(0xff7B7B7B))),
              Text("LE ${fakeMyOrders[index]["total_price"]}",
                  style: TextStyle(
                      fontSize: 17.sp, height: 2.h, fontFamily: FontFamily.bold)),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text("Order status  ",
                      style: TextStyle(
                          fontSize: 16.sp, fontFamily: FontFamily.bold)),
                  Text("${fakeMyOrders[index]["status"]}",
                      style: TextStyle(
                          fontSize: 16.sp,color: getStatusTextColor(fakeMyOrders[index]["status"].toString()), fontFamily: FontFamily.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
