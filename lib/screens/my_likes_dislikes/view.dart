import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/item_like_dislike.dart';
import 'components/item_selected_filter.dart';

class MyLikesAndDisLikesScreen extends StatefulWidget {
  final bool isLikes;

  const MyLikesAndDisLikesScreen({Key? key, this.isLikes = true})
      : super(key: key);

  @override
  State<MyLikesAndDisLikesScreen> createState() =>
      _MyLikesAndDisLikesScreenState();
}

class _MyLikesAndDisLikesScreenState extends State<MyLikesAndDisLikesScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(
        title: widget.isLikes ? "My Likes" : "My Dislikes",
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
              itemBuilder: (_, index) => ItemLikeDisLike(isBig: index.isOdd),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
