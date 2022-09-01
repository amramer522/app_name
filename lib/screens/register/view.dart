import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/screens/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper_methods.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/app_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                Text("CREATE\nA NEW ACCOUNT",
                    style: TextStyle(
                        fontSize: 28.sp, fontFamily: FontFamily.extraBold)),
                const AppInput(
                  label: "Full name*",
                  isRequired: true,
                  hint: "amr mohamed hassan",
                ),
                const AppInput(
                  label: "Email address",
                  isRequired: true,
                  hint: "name@example.com",
                ),
                const AppInput(
                  label: "Password",
                  isRequired: true,
                  isPassword: true,
                ),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                    child:
                        ElevatedButton(onPressed: () {
                          navigateTo(page: const LoginScreen(),leaveHistory: false);
                        }, child: const Text("CREATE ACCOUNT"))),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 65.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Already have an account?",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular)),
                      TextButton(onPressed: () {
                        navigateTo(page: const LoginScreen(),leaveHistory: false);
                      }, child: Text("Sign in",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular,color: const Color(0xff034C65)))),
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
