import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/screens/add_new_address/components/drop_down.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(title: "Add an address"),
      body: SingleChildScrollView(
        padding: mainPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Address",
              style: TextStyle(fontSize: 28.sp, fontFamily: FontFamily.bold),
            ),
            Text(
              "Add your delivery address",
              style: TextStyle(fontSize: 20.sp, fontFamily: FontFamily.regular),
            ),
            SizedBox(
              height: 35.h,
            ),
            Text("Contact number",
                style: TextStyle(fontSize: 17.sp, fontFamily: FontFamily.bold)),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 45.h,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Phone number",
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w)),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text("Location",
                style: TextStyle(fontSize: 17.sp, fontFamily: FontFamily.bold)),
            SizedBox(
              height: 5.h,
            ),
            const DropDown(
              hint: "City",
              list: ['Mansoura', 'Cairo', 'Saudi', 'Met Ghamr'],
            ),
            SizedBox(
              height: 15.h,
            ),
            const DropDown(
              hint: "Area",
              list: ['A1', 'A2', 'A3', 'A4'],
            ),
            SizedBox(
              height: 25.h,
            ),
            Text("Directions",
                style: TextStyle(fontSize: 17.sp, fontFamily: FontFamily.bold)),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 45.h,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Street name",
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w)),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 45.h,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Building name/number",
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w)),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Floor number",
                          contentPadding:
                          EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w)),
                    ),
                  ),
                ),
                SizedBox(width: 15.w,),
                Expanded(
                  child: SizedBox(
                    height: 45.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Flat number",
                          contentPadding:
                          EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                primary: colorPrimary, fixedSize: Size(350.w, 50.h)),
            child: const Text("Save address")),
      ),
    );
  }
}
