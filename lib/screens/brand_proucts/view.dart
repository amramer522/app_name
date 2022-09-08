import 'package:app_name/screens/my_likes_dislikes/components/item_like_dislike.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            padding: EdgeInsetsDirectional.only(start: 20.w),
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
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.h,
                  childAspectRatio: 167.w/266.h),
              itemBuilder: (_, index) => ItemLikeDisLike(isBig: index.isOdd,index: index),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
