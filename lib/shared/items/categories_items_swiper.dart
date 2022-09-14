import 'package:app_name/screens/filter/view.dart';
import 'package:app_name/screens/product_details/view.dart';
import 'package:app_name/shared/added_to_cart_dialog.dart';
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


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: SwipeCards(
        matchEngine: _matchEngine!,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsetsDirectional.only(top: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                            children: [
                              SizedBox(
                                width: 16.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateTo(page: FilterScreen());
                                  // showFilterDialog(context);
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 45.h,
                                  padding: EdgeInsets.all(12.r),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    color: Color(0xff090808)
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.icons.filter,
                                    color: Color(0xffF5F7F9),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text("678 Found Results",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontFamily: FontFamily.regular,
                                      color: colorPrimary)),
                              Spacer(),
                              SvgPicture.asset("assets/icons/reload.svg"),
                              SizedBox(width: 15.w,),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  )),
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
                                  child: GestureDetector(
                                    onTap: (){
                                      navigateTo(page: ProductDetailsScreen());
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      "https://www.cips.org/supply-management-jobs/getasset/63f90cc8-0778-4023-80b9-85246ce586b0/",
                                      height: 350.h,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Divider(),
                                SizedBox(height: 16.h,),
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
                                SizedBox(height: 16.h,),
                                Text(
                                  "Dimension",
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      fontFamily: FontFamily.bold),
                                ),
                                Text(
                                  "23 cm * 30 cm",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.regular,color: Color(0xff7B7B7B)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
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
                                OutlinedButton.icon(
                                  onPressed: () {
                                    showAddToCartSheet(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      side: BorderSide(color: colorPrimary),
                                      fixedSize: Size(340.w, 55.h),
                                      shadowColor: Colors.transparent),
                                  label: Text("Add To Cart",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontFamily: FontFamily.bold)),
                                  icon: Padding(
                                    padding: EdgeInsets.all(2.r),
                                    child:
                                        SvgPicture.asset("assets/icons/add_to_cart.svg",color: Color(0xff090808),),
                                  ),
                                ),
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
