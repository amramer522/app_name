import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/core/styles/colors.dart';
import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/gen/assets.gen.dart';
import 'package:app_name/screens/brand_profile/view.dart';
import 'package:app_name/screens/editor/view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../fake_data/fake_data.dart';
import '../../gen/fonts.gen.dart';

class ItemBrandCollage extends StatefulWidget {
  final int index;
  final bool withEditCollage;

  const ItemBrandCollage(
      {Key? key, required this.index, this.withEditCollage = true})
      : super(key: key);

  @override
  State<ItemBrandCollage> createState() => _ItemBrandCollageState();
}

class _ItemBrandCollageState extends State<ItemBrandCollage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: GestureDetector(
              onTap: () {
                navigateTo(page: BrandProfileScreen());
              },
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  (fakeBrandCollagesDetails[widget.index]["provider"]
                      as Map)["image"],
                ),
              ),
            ),
            title: Text(
              (fakeBrandCollagesDetails[widget.index]["provider"]
                  as Map)["name"],
              style: TextStyle(fontSize: 20.sp, fontFamily: FontFamily.bold),
            ),
            subtitle: Text(
                fakeBrandCollagesDetails[widget.index]["from_time"].toString(),
                style: TextStyle(fontSize: 18.sp, fontFamily: FontFamily.bold)),
            trailing: widget.withEditCollage
                ? GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      Assets.icons.download,
                      height: 29.h,
                      width: 29.h,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          CachedNetworkImage(
            imageUrl:
                fakeBrandCollagesDetails[widget.index]["image"].toString(),
            height: 390.h,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: mainPagePadding,
            child: Row(
              children: [
                Text(
                    fakeBrandCollagesDetails[widget.index]["collage_name"]
                        .toString(),
                    style: TextStyle(
                        fontSize: 20.sp, fontFamily: FontFamily.bold)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Share.share('check out my website https://example.com');
                    },
                    icon: const Icon(Icons.share)),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        height: 40.h,
                        width: 40.h,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: colorSecondary),
                        child: SvgPicture.asset(
                          Assets.icons.addToCart,
                        )))
              ],
            ),
          ),
          Padding(
            padding: mainPagePadding,
            child: Row(
              children: [
                Text("EGP",style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.regular)),
                SizedBox(width: 5.w,),
                Text("29.00",style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.bold)),
                SizedBox(width: 10.w,),
                Text("35.00",style: TextStyle(fontSize: 13.sp,decoration: TextDecoration.lineThrough,decorationThickness: 20.h,fontFamily: FontFamily.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          widget.withEditCollage
              ? Padding(
                  padding: mainPagePadding,
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            navigateTo(page: EditorScreen());
                          },
                          child: Text(
                            "Edit Collage",
                          ))),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
