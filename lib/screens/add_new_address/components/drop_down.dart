import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';
class DropDown extends StatefulWidget {
  final String hint;
  final List<String> list;
   const DropDown({Key? key,required this.hint,required this.list}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          color: Color(0xffEBEBEB),
          borderRadius: BorderRadius.circular(7.r)
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        hint: Text(widget.hint,
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: FontFamily.extraBold,
              color: const Color(0xff7B7B7B)
            )),
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
        elevation: 16,
        style: const TextStyle(color: Color(0xff7B7B7B)),
        underline: Container(
          height: 0.h,
          color: const Color(0xffEBEBEB),
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: widget.list
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: FontFamily.extraBold,
                  // color: const Color(0xff7B7B7B)
                )),
          );
        }).toList(),
      ),
    );
  }
}
