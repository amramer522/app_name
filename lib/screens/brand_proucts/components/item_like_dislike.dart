import 'package:app_name/screens/product_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper_methods.dart';
import '../../../gen/fonts.gen.dart';

class ItemBrandProduct extends StatefulWidget {
  final bool isBig;
  final int index;
  final double? width;
  const ItemBrandProduct({Key? key, this.isBig = false,required this.index, this.width}) : super(key: key);

  @override
  State<ItemBrandProduct> createState() => _ItemBrandProductState();
}

class _ItemBrandProductState extends State<ItemBrandProduct> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(page: ProductDetailsScreen());
      },
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.topEnd,
            height: widget.isBig ? 170.h : 150.h,
            width: widget.width??double.infinity,
            decoration: BoxDecoration(
                color:  Color(0xffC1C6C8*(widget.index+1)).withOpacity(.5), borderRadius: BorderRadius.circular(8.r)),
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
      ),
    );
  }
}
