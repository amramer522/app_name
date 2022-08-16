import 'package:app_name/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/styles/colors.dart';
import '../gen/fonts.gen.dart';

saveCollageDialog(context,{TextEditingController? controller,VoidCallback? onSavePress}) {
  showDialog(
      builder: (context) => AlertDialog(content: Container(
        height: 301.h,
        width: 350.w,
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/save_collage_image.svg",height: 81.h,width: 81.h,),
            SizedBox(height: 13.h,),
            Text("Save your collage",
                style: TextStyle(
                    fontSize: 28.sp,
                    height: 1.1.h,
                    decoration: TextDecoration.none,
                    fontFamily: FontFamily.extraBold,
                    color: Colors.black)),
            SizedBox(height: 17.h,),
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter collage name"
              ),
            ),
            SizedBox(height: 25.h,),
            ElevatedButton(onPressed: onSavePress, child: const Text("Save Collage"))
          ],
        ),
      ),),
      context: context);
}
