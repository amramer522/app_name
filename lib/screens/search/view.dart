import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/styles.dart';
import '../../shared/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondAppBar(
        title: 'Search',
      ),
      body: Container(
        width: double.infinity,
        padding: mainPagePadding,
        child: Column(
          children: [
            const SearchBar(
              isEnabled: true,
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.horizontal,
                children: List.generate(
                    6,
                    (index) => Container(
                          height: 44.h,
                          width: 70.w+(index*20),
                          margin: EdgeInsetsDirectional.only(top: 10.h,end: 10.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffE6E6E6)),
                            borderRadius: BorderRadius.circular(10.r)
                          ),
                          child: const Center(
                            child: Text("hello"),
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
