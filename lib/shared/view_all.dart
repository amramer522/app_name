import 'package:app_name/core/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/colors.dart';
import '../gen/fonts.gen.dart';

class ViewAll extends StatelessWidget {
  final String label;
  final Widget? page;

  const ViewAll({Key? key, required this.label, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          Text(label,
              style:
                  TextStyle(fontSize: 20.sp, fontFamily: FontFamily.regular)),
          const Spacer(),
          GestureDetector(
            onTap: () {
              navigateTo(context, page: page);
            },
            child: Text("View All",
                style: TextStyle(fontSize: 15.sp, fontFamily: FontFamily.bold)),
          )
        ],
      ),
    );
  }
}
