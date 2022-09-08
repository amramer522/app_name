import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_methods.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../editor/view.dart';
import '../home/components/top_collages_items_card.dart';
import 'components/item_category.dart';

class AllCategoriesScreen extends StatelessWidget {
  final bool fromHome;

  const AllCategoriesScreen({Key? key, this.fromHome = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: "Categories List", haveBack: !fromHome),
      body: ListView.builder(
        padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 18.h,end: 20.w),
        itemCount: 4,
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: 20.h, bottom: 9.h),
                child: Text('Category $index',
                    style: TextStyle(
                        fontSize: 20.sp, fontFamily: FontFamily.bold)),
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
                itemBuilder: (_, index) => ItemCategory(fromHome: fromHome),
              )
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: fromHome
          ? const SizedBox.shrink()
          : Padding(
              padding: EdgeInsetsDirectional.only(bottom: 20.h),
              child: ElevatedButton(
                onPressed: () {
                  navigateTo(page: EditorScreen());
                },
                style: ElevatedButton.styleFrom(fixedSize: Size(321.w, 45.h)),
                child: const Text("Add to Editor"),
              ),
            ),
    );
  }
}
