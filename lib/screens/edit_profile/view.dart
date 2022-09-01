import 'dart:io';

import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/screens/login/view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/helper_methods.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/app_input.dart';
import '../../shared/choose_image_source_dialog.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? currentImage;

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
                  height: 30.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => const ChooseImageSourceDialog(),
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(25.w),
                                topEnd: Radius.circular(25.w)),
                          )).then((value) {
                        if (value != null) {
                          currentImage = value as File;
                          setState(() {});
                        }
                      });
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 55.r,
                          backgroundImage: currentImage != null
                              ? FileImage(
                            currentImage!,
                          ) as ImageProvider
                              : const CachedNetworkImageProvider(
                            "https://www.incimages.com/uploaded_files/image/1920x1080/getty_481292845_77896.jpg",
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          decoration: const BoxDecoration(
                              color: Color(0xffE6E6E6), shape: BoxShape.circle),
                          child: Center(
                            child: GestureDetector(
                                child:Icon(Icons.camera_alt,size: 20.sp,color: const Color(0xff2F1F2B),),
                                onTap: () {}),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text("My information",
                    style: TextStyle(
                        fontSize: 28.sp, fontFamily: FontFamily.extraBold,color: const Color(0xff2F1F2B))),
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
                  label: "Mobile number",
                ),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          navigateTo(
                              page: const LoginScreen(), leaveHistory: false);
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(340.w, 44.h)),
                        child: Text("Confirm",))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
