import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/screens/add_new_address/view.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
import 'components/item_my_address.dart';

class MyAddressesScreen extends StatelessWidget {
  MyAddressesScreen({Key? key}) : super(key: key);
  List<String> titles = ["Default address", "Other Address"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: "My address"),
      body: ListView.builder(
        // outer ListView
        itemCount: 2,
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.w, top: 20.h),
                child: Text(titles[index],
                    style: TextStyle(
                        fontSize: 20.sp, fontFamily: FontFamily.bold)),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: index==0?1:2,
                itemBuilder: (_, index) => const ItemMyAddress(),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
        child: ElevatedButton(
          onPressed: () {
            navigateTo(page: const AddNewAddress());
          },
          child: const Text("Add New Address"),
        ),
      ),
    );
  }
}
