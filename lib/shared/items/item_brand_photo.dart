import 'package:app_name/core/styles/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../fake_data/fake_data.dart';
import '../../gen/fonts.gen.dart';

class ItemBrandPhoto extends StatefulWidget {
  final int index;

  const ItemBrandPhoto({Key? key, required this.index}) : super(key: key);

  @override
  State<ItemBrandPhoto> createState() => _ItemBrandPhotoState();
}

class _ItemBrandPhotoState extends State<ItemBrandPhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: fakeBrandPhotosDetails[widget.index]["image"].toString(),
            height: 390.h,
            width: double.infinity,
            // fit: BoxFit.fill,
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    fakeBrandPhotosDetails[widget.index]["isFavorite"] =
                        !(fakeBrandPhotosDetails[widget.index]["isFavorite"]
                            as bool);
                    setState(() {});
                  },
                  icon:
                      fakeBrandPhotosDetails[widget.index]["isFavorite"] as bool
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border)),
              Text("liked by ",
                  style: TextStyle(
                      fontSize: 17.sp, fontFamily: FontFamily.regular)),
              Text(
                  fakeBrandPhotosDetails[widget.index]["number_of_favorites"]
                      .toString(),
                  style:
                      TextStyle(fontSize: 17.sp, fontFamily: FontFamily.bold)),
              Text(" others",
                  style: TextStyle(
                      fontSize: 17.sp, fontFamily: FontFamily.regular)),
              const Spacer(),
              IconButton(onPressed: () {

              }, icon: const Icon(Icons.share)),
            ],
          ),
          Padding(
            padding: mainPagePadding,
            child: Text(
                fakeBrandPhotosDetails[widget.index]["description"].toString(),
                style: TextStyle(
                    fontSize: 16.5.sp,
                    fontFamily: FontFamily.regular,
                    color: const Color(0xff7B7B7B))),
          )
        ],
      ),
    );
  }
}
