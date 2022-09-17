import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedStyle = 1;
  int selectedType = 1;
  int selectedColor = 1;
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  int selectedFilterPrice=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SecondAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
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
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 35.h,
                        width: 35.h,
                        color: Colors.transparent,
                        child: const Icon(
                          Icons.close,
                        ),
                      )),
                  // SizedBox(
                  //   width: 20.w,
                  // ),
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
                          fontSize: 20.sp, fontFamily: FontFamily.bold)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
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
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Colors",
                      style: TextStyle(
                          fontSize: 20.sp, fontFamily: FontFamily.bold)),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  selectedColor = index;
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: selectedColor == index
                                          ? Border.all(
                                              color: Color(
                                                  0xffD99B61 * (index + 1)),
                                              width: 4.h)
                                          : null),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color(0xffF32323 * (index + 2)),
                                    radius: 20.r,
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 22.5.w,
                              ),
                          itemCount: 20),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      subtitle: Text(selectedFilterPrice==0?"Highest Price":"Lowest Price"),
                        tilePadding: EdgeInsets.zero,
                        children: [
                          GestureDetector(
                            onTap: (){
                              selectedFilterPrice =0;
                              setState(() {

                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: selectedFilterPrice,
                                    onChanged: (value) {

                                    },
                                  ),
                                  const Text("Highest Price"),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              selectedFilterPrice =1;
                              setState(() {

                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: selectedFilterPrice,
                                    onChanged: (value) {
                                    },
                                  ),
                                  const Text("Lowest Price"),
                                ],
                              ),
                            ),
                          ),
                        ],
                        title: Text("Sort By",
                            style: TextStyle(
                                fontSize: 18.sp, fontFamily: FontFamily.bold))),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Types",
                      style: TextStyle(
                          fontSize: 20.sp, fontFamily: FontFamily.bold)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          5,
                          (index) => GestureDetector(
                                onTap: () {
                                  selectedType = index;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 44.h,
                                  width: 100.w,
                                  margin: EdgeInsetsDirectional.only(
                                      end: 10.w, top: 10.h),
                                  decoration: BoxDecoration(
                                      color: index == selectedType
                                          ? colorPrimary
                                          : Colors.transparent,
                                      border: index != selectedType
                                          ? Border.all()
                                          : null,
                                      borderRadius: BorderRadius.circular(6.r)),
                                  child: Center(
                                      child: Text(
                                    "Hello",
                                    style: TextStyle(
                                        color: index == selectedType
                                            ? Colors.white
                                            : null),
                                  )),
                                ),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Price",
                      style: TextStyle(
                          fontSize: 20.sp, fontFamily: FontFamily.bold)),
                  SizedBox(
                    height: 5.h,
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
                  SizedBox(
                    height: 30.h,
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
