import 'package:app_name/screens/filter/view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../core/helper_methods.dart';
import '../../core/styles/colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../screens/editor/view.dart';
import '../fileter_dialog.dart';
import '../toast.dart';

class CategoriesItemsSwiper extends StatefulWidget {
  const CategoriesItemsSwiper({Key? key}) : super(key: key);

  @override
  State<CategoriesItemsSwiper> createState() => _CategoriesItemsSwiperState();
}

class _CategoriesItemsSwiperState extends State<CategoriesItemsSwiper> {
  final List<SwipeItem> _swipeItems = [];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink"
  ];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: {"text": _names[i], "color": _colors[i]},
          likeAction: () {
            showToast(
              context,
              msg: "Like",
            );
          },
          nopeAction: () {
            showToast(
              context,
              msg: "Dislike",
            );
          },
          superlikeAction: () {
            showToast(
              context,
              msg: "No Action on Item",
            );
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: SwipeCards(
        matchEngine: _matchEngine!,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    )),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 11.h),
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(7.r)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.r),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 16.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateTo(page: FilterScreen());
                                  // showFilterDialog(context);
                                },
                                child: SvgPicture.asset(
                                  Assets.icons.filter,
                                  height: 20.h,
                                  width: 20.h,
                                ),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text("678 Found Results",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontFamily: FontFamily.regular,
                                      color: colorPrimary))
                            ],
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 16.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                    "https://www.cips.org/supply-management-jobs/getasset/63f90cc8-0778-4023-80b9-85246ce586b0/",
                                    height: 350.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 16.h,),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Product Name",
                                          style: TextStyle(
                                              fontSize: 22.sp,
                                              fontFamily: FontFamily.bold),
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("LE 0.00",
                                                style: TextStyle(
                                                  color: const Color(0xffC9C9C9),
                                                  fontSize: 17.sp,
                                                  fontFamily: FontFamily.regular,
                                                  decoration: TextDecoration.lineThrough,
                                                )),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text("LE 0.00",
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontFamily: FontFamily.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            height: 40.h,
                                            width: 40.h,
                                            padding: EdgeInsets.all(8.r),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(7.r),
                                                color: colorSecondary),
                                            child: SvgPicture.asset(
                                              Assets.icons.addToCart,
                                            )))
                                  ],
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),

                                // Text("Size",
                                //     style: TextStyle(
                                //         fontSize: 17.sp,
                                //         fontFamily: FontFamily.bold)),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                                // SizedBox(
                                //   height: 34.h,
                                //   child: ListView.separated(
                                //     itemBuilder: (context, index) => Container(
                                //       width: 66.w,
                                //       decoration: BoxDecoration(
                                //           color: const Color(0xffE6E6E6),
                                //           borderRadius:
                                //           BorderRadius.circular(3.r)),
                                //       child: const Center(child: Text("UK 10")),
                                //     ),
                                //     separatorBuilder: (context, index) =>
                                //         SizedBox(
                                //           width: 10.w,
                                //         ),
                                //     itemCount: 3,
                                //     scrollDirection: Axis.horizontal,
                                //   ),
                                // ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    navigateTo(page: EditorScreen());
                                  },
                                  child: const Text("Add to Editor"),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.grey.withOpacity(.08),
                                      elevation: 0,
                                      shadowColor: Colors.transparent),
                                  label: Text("Previous",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontFamily: FontFamily.regular)),
                                  icon: Padding(
                                    padding: EdgeInsets.all(2.r),
                                    child:
                                        SvgPicture.asset("assets/icons/reload.svg"),
                                  ),
                                ),
                                SizedBox(
                                  height: 100.h,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        onStackFinished: () {
          Navigator.pop(context);
          showToast(
            context,
            msg: "No More Items",
          );
        },
        itemChanged: (SwipeItem item, int index) {
          print("item: ${item.content["text"]}, index: $index");
        },
        upSwipeAllowed: true,
        fillSpace: true,
      ),
    );
  }
}
