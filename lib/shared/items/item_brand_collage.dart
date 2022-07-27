import 'package:app_name/core/styles/colors.dart';
import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../fake_data/fake_data.dart';
import '../../gen/fonts.gen.dart';

class ItemBrandCollage extends StatefulWidget {
  final int index;

  const ItemBrandCollage({Key? key, required this.index}) : super(key: key);

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
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                (fakeBrandCollagesDetails[widget.index]["provider"]
                    as Map)["image"],
              ),
            ),
            title: Text((fakeBrandCollagesDetails[widget.index]["provider"]
                as Map)["name"]),
            subtitle: Text(
                fakeBrandCollagesDetails[widget.index]["from_time"].toString()),
            trailing: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                Assets.icons.download,
                height: 29.h,
                width: 29.h,
              ),
            ),
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
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                SizedBox(
                  width: 6.w,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        height: 35.h,
                        width: 35.h,
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
            child: SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () {}, child: Text("Edit Collage",style: TextStyle(fontSize: 18.sp,fontFamily: FontFamily.regular,)))),
          )
        ],
      ),
    );
  }
}
