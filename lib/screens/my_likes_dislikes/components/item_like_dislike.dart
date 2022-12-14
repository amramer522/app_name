import '/../core/helper_methods.dart';
import '/../screens/product_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';

class ItemProduct extends StatefulWidget {
  final bool isBig;
  final int index;
  final double? width;
  const ItemProduct({Key? key, this.isBig = false,required this.index, this.width}) : super(key: key);

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(page: const ProductDetailsScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.topEnd,
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
          ),
          SizedBox(height: 10.h,),
          Text("This product full",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.sp, fontFamily: FontFamily.bold)),
          SizedBox(height: 10.h,),
          Text(" name", maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.sp, fontFamily: FontFamily.bold)),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Text("EGP",style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.regular)),
              SizedBox(width: 5.w,),
              Text("29.00",style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.bold)),
              SizedBox(width: 10.w,),
              Text("35.00",style: TextStyle(fontSize: 13.sp,decoration: TextDecoration.lineThrough,decorationThickness: 20.h,fontFamily: FontFamily.bold)),
            ],
          )
        ],
      ),
    );
  }
}
