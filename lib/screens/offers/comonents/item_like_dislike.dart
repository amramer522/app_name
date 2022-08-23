import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';

class ItemOffer extends StatefulWidget {
  final bool isBig;
  final int index;
  const ItemOffer({Key? key, this.isBig = false,required this.index}) : super(key: key);

  @override
  State<ItemOffer> createState() => _ItemOfferState();
}

class _ItemOfferState extends State<ItemOffer> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: AlignmentDirectional.topStart,
          height: widget.isBig ? 170.h : 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color:  Color(0xffC1C6C8*(widget.index+1)).withOpacity(.5), borderRadius: BorderRadius.circular(8.r)),
          child:   Container(
            height: 28.h,
            width: 52.w,
            child: Center(
                child: Text("-25%",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontFamily: FontFamily.regular))),
            decoration: BoxDecoration(
                color: Color(0xffE14B34),
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(10.r),
                  bottomEnd: Radius.circular(10.r),
                )),
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
