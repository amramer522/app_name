import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/item_like_dislike.dart';
import 'components/item_selected_filter.dart';

class BrandProductScreen extends StatefulWidget {
  final String title;


  const BrandProductScreen({Key? key,required this.title})
      : super(key: key);

  @override
  State<BrandProductScreen> createState() =>
      _BrandProductScreenState();
}

class _BrandProductScreenState extends State<BrandProductScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(
        title: widget.title,
        isFilter: true,
        haveAction: true,
      ),
      body: Column(
        children: [
          Container(
            height: 40.h,
            padding: EdgeInsetsDirectional.only(start: 13.w, end: 13.w),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ItemSelectedFilter(
                    title: "Cat$index",
                    isSelected: index==currentIndex,
                    onPress: () {
                      currentIndex = index;
                      setState(() {});
                    }),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    )),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.r),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.h,
                  childAspectRatio: .7),
              itemBuilder: (_, index) => ItemBrandProduct(isBig: index.isOdd,index: index),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
