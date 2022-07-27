import 'package:app_name/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/colors.dart';
import '../gen/fonts.gen.dart';

showLogoutDialog(context) {
  showDialog(
      builder: (context) => AlertDialog(
            content: Container(
              width: 354.h,
              height: 160.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Alert",
                      style: TextStyle(
                          fontSize: 25.sp, fontFamily: FontFamily.extraBold)),
                  Text("Are you Sure want to Logout?",
                      style: TextStyle(
                          fontSize: 20.sp, fontFamily: FontFamily.medium)),
                  Padding(
                    padding: mainPagePadding,
                    child: Row(
                      children: [
                        Expanded(child: OutlinedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Cancel",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.bold)))),
                        SizedBox(width: 10.w,),
                        Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Logout",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.bold)))),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
      context: context);
}
