import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
import 'components/item_my_address.dart';

class MyAddressesScreen extends StatelessWidget {
  const MyAddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: "My address"),
      body: ListView.builder( // outer ListView
        itemCount: 4,
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.w,top: 20.h),
                child: Text('Addresses $index',style: TextStyle(fontSize: 20.sp,fontFamily: FontFamily.bold)),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, index) => const ItemMyAddress(),
              )
            ],
          );

        },
      ),
    );
  }
}
