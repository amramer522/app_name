import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/screens/forget_password/view.dart';
import 'package:app_name/screens/home/view.dart';
import 'package:app_name/screens/register/view.dart';
import 'package:app_name/shared/done_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/app_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 50.h,
                ),
                Text("LOGIN TO\nMY ACCOUNT",
                    style: TextStyle(
                        fontSize: 28.sp, fontFamily: FontFamily.extraBold)),
                AppInput(
                  label: "Email address",
                  isRequired: true,
                  hint: "name@example.com",
                ),
                AppInput(
                  label: "Password",
                  isRequired: true,
                  isPassword: true,
                ),
                SizedBox(
                  height: 12.h,
                ),
                GestureDetector(
                    onTap: () {
                      navigateTo(context, page: ForgetPasswordScreen());
                    },
                    child: Text("Forgot Password",
                        style: TextStyle(
                            fontSize: 14.sp, fontFamily: FontFamily.bold))),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          navigateTo(context, page: HomeScreen());
                        },
                        child: Text("NEXT"))),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 65.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("New to app?",
                          style: TextStyle(
                              fontSize: 17.sp, fontFamily: FontFamily.regular)),
                      TextButton(
                          onPressed: () {
                            navigateTo(context, page: RegisterScreen());
                          },
                          child: Text("Sign up",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: FontFamily.regular,
                                  color: const Color(0xff034C65)))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
