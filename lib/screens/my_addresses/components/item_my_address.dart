import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helper_methods.dart';
import '../../../core/styles/colors.dart';
import '../../../gen/fonts.gen.dart';
import '../../add_new_address/view.dart';

class ItemMyAddress extends StatefulWidget {
  final bool withDelete;

  const ItemMyAddress({Key? key, this.withDelete = true}) : super(key: key);

  @override
  State<ItemMyAddress> createState() => _ItemMyAddressState();
}

class _ItemMyAddressState extends State<ItemMyAddress> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148.h,
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsetsDirectional.only(
          start: widget.withDelete ? 20.w : 0,
          top: 20.h,
          end: widget.withDelete ? 20.w : 0),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurStyle: BlurStyle.outer,
              blurRadius: 5,
              spreadRadius: 1)
        ],
        borderRadius: BorderRadiusDirectional.circular(6.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Khalid Ibn Elwalid st 9th street,Old Maadi, Cairo",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: FontFamily.regular,
                  color: Colors.black)),
          SizedBox(
            height: 35.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    isChecked = !isChecked;
                    setState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 25.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffC9C9C9)),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: Center(
                            child: isChecked
                                ? Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 16.h,
                                  )
                                : const SizedBox.shrink()),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("Make default address",
                          style: TextStyle(
                              fontSize: 16.sp, fontFamily: FontFamily.regular)),
                    ],
                  ),
                ),
                const Spacer(),
                widget.withDelete
                    ? GestureDetector(
                  onTap: (){

                  },
                      child: Container(
                        color: Colors.transparent,
                        height: 30.h,
                        padding: EdgeInsets.all(6.r),
                        width: 30.h,
                        child: SvgPicture.asset(
                            "assets/icons/delete.svg",
                            color: Colors.red,
                          ),
                      ),
                    )
                    : SizedBox.shrink(),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () {
                    navigateTo(
                        page: AddNewAddress(
                      isEdit: true,
                    ));
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(8.r),
                    height: 30.h,
                    width: 30.h,
                    child: SvgPicture.asset(
                      "assets/icons/edit_pin.svg",
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
