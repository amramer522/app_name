import 'package:app_name/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/app_input.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: mainPagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 50.h,
                ),
                Text("FORGET PASSWORD",
                    style: TextStyle(
                        fontSize: 28.sp, height: 2.5.h,fontFamily: FontFamily.extraBold)),
                Text("Please enter your email address, you will\nreceive a link to create a new password via",
                    style: TextStyle(
                        fontSize: 15.sp, height: 1.3.h,fontFamily: FontFamily.regular,color: const Color(0xff353636))),
                SizedBox(
                  height: 60.h,
                ),
                const AppInput(
                  label: "Email",
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                    child:
                        ElevatedButton(onPressed: () {}, child: const Text("SEND"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
