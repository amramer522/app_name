import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/styles/colors.dart';
import '../gen/assets.gen.dart';
import '../gen/fonts.gen.dart';

class TestFilterScreen extends StatefulWidget {
  const TestFilterScreen({Key? key}) : super(key: key);

  @override
  State<TestFilterScreen> createState() => _TestFilterScreenState();
}

class _TestFilterScreenState extends State<TestFilterScreen> {
  int selectedStyle = 1;
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Filter",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontFamily: FontFamily.bold,
                          color: colorPrimary)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                      )),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Style",
                      style: TextStyle(
                          fontSize: 15.sp, fontFamily: FontFamily.bold)),
                  Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                        5,
                        (index) => GestureDetector(
                              onTap: () {
                                selectedStyle = index;
                                setState(() {});
                              },
                              child: Container(
                                height: 44.h,
                                width: 100.w,
                                margin: EdgeInsetsDirectional.only(
                                    end: 10.w, top: 10.h),
                                decoration: BoxDecoration(
                                    color: index == selectedStyle
                                        ? colorPrimary
                                        : Colors.transparent,
                                    border: index != selectedStyle
                                        ? Border.all()
                                        : null,
                                    borderRadius: BorderRadius.circular(6.r)),
                                child: Center(
                                    child: Text(
                                  "Hello",
                                  style: TextStyle(
                                      color: index == selectedStyle
                                          ? Colors.white
                                          : null),
                                )),
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Types",
                      style: TextStyle(
                          fontSize: 15.sp, fontFamily: FontFamily.bold)),
                  Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                        5,
                        (index) => GestureDetector(
                              onTap: () {
                                selectedStyle = index;
                                setState(() {});
                              },
                              child: Container(
                                height: 44.h,
                                width: 100.w,
                                margin: EdgeInsetsDirectional.only(
                                    end: 10.w, top: 10.h),
                                decoration: BoxDecoration(
                                    color: index == selectedStyle
                                        ? colorPrimary
                                        : Colors.transparent,
                                    border: index != selectedStyle
                                        ? Border.all()
                                        : null,
                                    borderRadius: BorderRadius.circular(6.r)),
                                child: Center(
                                    child: Text(
                                  "Hello",
                                  style: TextStyle(
                                      color: index == selectedStyle
                                          ? Colors.white
                                          : null),
                                )),
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Colors",
                      style: TextStyle(
                          fontSize: 15.sp, fontFamily: FontFamily.bold)),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CircleAvatar(
                                backgroundColor:
                                    Color(0xffF32323 * (index + 2)),
                                radius: 20.r,
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 22.5.w,
                              ),
                          itemCount: 20),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Price",
                      style: TextStyle(
                          fontSize: 15.sp, fontFamily: FontFamily.bold)),
                  SizedBox(
                    height: 30.h,
                  ),
                  RangeSlider(
                    values: _currentRangeValues,
                    max: 100,
                    divisions: 10,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      Text("\$" + _currentRangeValues.start.round().toString(),
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: FontFamily.extraBold)),
                      const Spacer(),
                      Text("\$" + _currentRangeValues.end.round().toString(),
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: FontFamily.extraBold)),
                      SizedBox(
                        width: 30.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.08),
                        borderRadius: BorderRadius.circular(7.r)),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Apply",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: FontFamily.regular)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}