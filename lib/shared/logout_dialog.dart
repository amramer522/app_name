import '/../core/helper_methods.dart';
import '/../core/styles/styles.dart';
import '/../screens/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/fonts.gen.dart';

showLogoutDialog(context) {
  showDialog(
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r)),
            content: Container(
              width: 354.h,
              height: 160.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("ALERT",
                      style: TextStyle(
                          fontSize: 25.sp,color: Colors.black, fontFamily: FontFamily.regular)),
                  Text("Are you Sure want to Logout?",
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: FontFamily.medium)),
                  Padding(
                    padding: mainPagePadding,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 44.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 2.h),
                                borderRadius: BorderRadius.circular(10.r)
                              ),
                              child: Center(
                                child: Text("Cancel",
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontFamily: FontFamily.bold)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  navigateTo(page: const LoginScreen(),leaveHistory: false);
                                },
                                child: const Text("Logout",))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      context: context);
}
