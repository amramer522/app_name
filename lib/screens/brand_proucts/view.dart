import '/../screens/my_likes_dislikes/components/item_like_dislike.dart';
import '/../shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/colors.dart';

class BrandProductScreen extends StatefulWidget {
  final String title;

  const BrandProductScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<BrandProductScreen> createState() => _BrandProductScreenState();
}

class _BrandProductScreenState extends State<BrandProductScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 10, vsync: this);
    tabController!.addListener(() {
      setState(() {
        currentIndex =tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(
        title: widget.title,
        isFilter: true,
        haveAction: true,
      ),
      body: DefaultTabController(
        length: 10,
        initialIndex: currentIndex,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20.w, bottom: 10.h),
              child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.red,
                  controller: tabController,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(8.r)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  onTap: (value) {
                    tabController!.animateTo(value);
                  },
                  padding: EdgeInsets.zero,
                  tabs: List.generate(
                      10,
                      (index) => Tab(
                            child: Container(
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Center(child: Text("Cat$index")),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xffC1C6C8).withOpacity(.3),
                                  borderRadius: BorderRadius.circular(8.r)),
                            ),
                          ))),
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: List.generate(
                  10,
                  (index) => GridView.builder(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.h,
                            mainAxisSpacing: 20.h,
                            childAspectRatio: 167.w / 266.h),
                        itemBuilder: (_, index) =>
                            ItemProduct(isBig: index.isOdd, index: index),
                        itemCount: 20,
                      )),
            ))
          ],
        ),
      ),
    );
  }
}
