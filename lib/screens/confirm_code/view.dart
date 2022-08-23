import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/screens/forget_password/view.dart';
import 'package:app_name/screens/home/view.dart';
import 'package:app_name/screens/register/view.dart';
import 'package:app_name/shared/done_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/app_input.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
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
                Text("Confirm your email ",
                    style: TextStyle(
                        fontSize: 28.sp, fontFamily: FontFamily.bold)),
                SizedBox(
                  height: 15.h,
                ),
                Text("We have sent you a OTP code, Please\nenter it below. ",
                    style: TextStyle(
                        fontSize: 15.sp, fontFamily: FontFamily.regular)),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  height: 60.h,
                ),
                PinCodeTextField(
                  length: 6,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    disabledColor: Colors.transparent,
                    activeColor: Colors.grey,
                    inactiveFillColor: const Color(0xffEEEEEE),
                    inactiveColor: Colors.transparent,
                    selectedColor: colorPrimary,
                    selectedFillColor: Colors.transparent,
                    fieldHeight: 64.h,
                    fieldWidth: 49.w,
                    activeFillColor: const Color(0xffEEEEEE),
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    // print(value);
                    // setState(() {
                    //   // currentText = value;
                    // });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
                SizedBox(
                  height: 210.h,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          navigateTo(page: HomeScreen());
                        },
                        child: const Text("Confirm"))),
                Center(
                  child: TextButton(
                      onPressed: () {

                      },
                      child: Text("Resend confirmation code",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: FontFamily.regular,
                              color: const Color(0xff034C65)))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
