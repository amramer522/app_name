import 'package:app_name/screens/notifications/components/item_notification.dart';
import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
import '../home/pages/all_categories/components/item_category.dart';
class NotificationsScreen extends StatelessWidget {
   NotificationsScreen({Key? key}) : super(key: key);

  var titles = ["Today","This Week","This Month"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: "Notifications"),
      body: ListView.builder( // outer ListView
        itemCount: titles.length,
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 18.w,),
                child: Text('${titles[index]}',style: TextStyle(fontSize: 20.sp,fontFamily: FontFamily.bold)),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, index) => const ItemNotification(),
              )
            ],
          );

        },
      ),
    );
  }
}
