import 'package:app_name/core/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/fonts.gen.dart';

class ViewAll extends StatelessWidget {
  final String label;
  final Widget? page;
  final bool isBold;

  const ViewAll({Key? key, required this.label, this.page, this.isBold=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          Text(label,
              style:
                  TextStyle(fontSize:isBold?25.sp: 20.sp, fontFamily:isBold?FontFamily.bold: FontFamily.regular)),
          const Spacer(),
          GestureDetector(
            onTap: () {
              navigateTo( page: page);
            },
            child: Text("View All",
                style: TextStyle(fontSize: isBold?20.sp:15.sp, fontFamily: FontFamily.bold)),
          )
        ],
      ),
    );
  }
}
