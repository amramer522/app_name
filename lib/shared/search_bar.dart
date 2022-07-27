import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/gen/assets.gen.dart';
import 'package:app_name/screens/search/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  final bool isEnabled;

  const SearchBar({Key? key, this.isEnabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, page: SearchScreen());
      },
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            height: 45.h,
            child: TextFormField(
              enabled: isEnabled,
              decoration: InputDecoration(hintText: "Search Categoties"),
            ),
          )),
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 45.h,
            width: 54.h,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(6.r)),
            child: SvgPicture.asset(
              Assets.icons.search,
            ),
          )
        ],
      ),
    );
  }
}
