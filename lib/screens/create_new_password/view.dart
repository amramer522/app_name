import '/../core/styles/styles.dart';
import '/../screens/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper_methods.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/app_input.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

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
                Text("Create new password",
                    style: TextStyle(
                        fontSize: 28.sp, fontFamily: FontFamily.extraBold)),
                Text(
                    "Your new password must be different from\npreviously password",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontFamily.medium,
                        color: const Color(0xff353636))),
                const AppInput(
                  label: "New password",
                  isPassword: true,
                ),
                const AppInput(
                  label: "Confirm  password",
                  isPassword: true,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          navigateTo(
                              page: const LoginScreen(), leaveHistory: false);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(340.w,44.h)
                        ),
                        child:  const Text("Create"))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
