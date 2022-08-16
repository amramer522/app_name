import 'package:app_name/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../fake_data/fake_data.dart';
class TopCollagesItemsCard extends StatelessWidget {
  const TopCollagesItemsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: SizedBox(
        height: 100.h,
        child: Row(
          children: [
            Image.network(
                fakeBrandPhotosDetails[0]["image"].toString()),
            SizedBox(width: 20.w,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Top Collages",style: TextStyle(fontSize: 18.sp,fontFamily: FontFamily.bold),),
                  SizedBox(height: 5.h,),
                  Text("10 Items",style: TextStyle(fontSize: 13.sp,fontFamily: FontFamily.regular),),
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.grey,))
          ],
        ),
      ),
    );
  }
}
