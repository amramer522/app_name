import '/../core/helper_methods.dart';
import '/../screens/home/pages/cart/components/item_cart_free.dart';
import '/../screens/payment_methods/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/styles.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../shared/second_app_bar.dart';
import 'components/item_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: "My Cart", haveBack: false),
      body: Container(
        width: double.infinity,
        padding: mainPagePadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...List.generate(
                  3,
                  (index) => Column(
                        children: [
                          ItemCart(index: index),
                          Divider(indent: 100.w, thickness: 1.5.h),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  "Free Items",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: FontFamily.bold,
                    color: const Color(0xff516E00),
                  ),
                ),
              ),
              ...List.generate(
                  3,
                  (index) => Column(
                        children: [
                          ItemCartFree(index: index),
                          Divider(indent: 100.w, thickness: 1.5.h),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      )),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Text("Subtotal",
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: FontFamily.regular)),
                  const Spacer(),
                  Text("LE 0,00",
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: FontFamily.regular)),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text("Shipping Fees",
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: FontFamily.regular)),
                  const Spacer(),
                  Text("LE 0,00",
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: FontFamily.regular)),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text("VAT",
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: FontFamily.regular)),
                  const Spacer(),
                  Text("LE 0,00",
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: FontFamily.regular)),
                ],
              ),
              Divider(thickness: 1.5.h),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text("Total Fees",
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: FontFamily.bold)),
                  const Spacer(),
                  Text("LE 0,00",
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: FontFamily.bold)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: Size(340.w, 55.h)),
          onPressed: () {
            navigateTo(page: const PaymentMethods());
          },
          child: const Text("Continue")),
    );
  }
}
