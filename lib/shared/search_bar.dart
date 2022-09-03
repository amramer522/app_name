import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/gen/assets.gen.dart';
import 'package:app_name/screens/search/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../gen/fonts.gen.dart';

class SearchBar extends StatelessWidget {
  final bool isEnabled;

  const SearchBar({Key? key, this.isEnabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(page: const SearchScreen());
      },
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            height: 50.h,
            child: TextFormField(
              enabled: isEnabled,
              autofocus: isEnabled,
              decoration: InputDecoration(
                  hintText: "What are you looking for?",
                  suffixIcon: Container(
                    width: 40.h,
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Padding(
                      padding: EdgeInsets.all(2.r),
                      child: SvgPicture.asset(
                        Assets.icons.search,
                      ),
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                      fontSize: 15.sp,
                      height: .75,
                      fontFamily: FontFamily.medium,
                      color: const Color(0xff7B7B7B)),
                  fillColor: const Color(0xffE6E6E6).withOpacity(.5)),
            ),
          )),
        ],
      ),
    );
  }
}
