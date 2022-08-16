import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';

class ItemLikeDisLike extends StatefulWidget {
  final bool isBig;

  const ItemLikeDisLike({Key? key, this.isBig = false}) : super(key: key);

  @override
  State<ItemLikeDisLike> createState() => _ItemLikeDisLikeState();
}

class _ItemLikeDisLikeState extends State<ItemLikeDisLike> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: AlignmentDirectional.topEnd,
          height: widget.isBig ? 170.h : 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xffC1C6C8), borderRadius: BorderRadius.circular(8.r)),
          child: IconButton(
            onPressed: () {
              isLiked = !isLiked;
              setState(() {});
            },
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? const Color(0xffF44336) : Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Text("This product full",
            style: TextStyle(fontSize: 13.sp, fontFamily: FontFamily.bold)),
        SizedBox(height: 10.h,),
        Text(" name",
            style: TextStyle(fontSize: 13.sp, fontFamily: FontFamily.bold)),
        SizedBox(height: 10.h,),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: "EGP",style: TextStyle(fontSize: 13.sp,fontFamily: FontFamily.bold)),
            TextSpan(text: "29.00",style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.bold)),
          ]),
        ),
      ],
    );
  }
}
