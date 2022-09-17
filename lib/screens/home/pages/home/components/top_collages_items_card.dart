import '/../core/styles/styles.dart';
import '/../gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TopCollagesItemsCard extends StatelessWidget {
  final String title;
  final int numberOfItems;
  final VoidCallback? onPress;
  const TopCollagesItemsCard({Key? key, required this.title, this.onPress, required this.numberOfItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
        boxShadow: shadowOfItem(),
          borderRadius: BorderRadius.circular(12.r),
          // color: Colors.red,

        ),
        margin: EdgeInsets.only(top: 16.h,),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: SizedBox(
            height: 100.h,
            child: Row(
              children: [
                Container(
                  height: 100.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xff034C65*numberOfItems)
                  ),
                ),
                SizedBox(width: 20.w,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: TextStyle(fontSize: 20.sp,fontFamily: FontFamily.bold),),
                      SizedBox(height: 5.h,),
                      Text("$numberOfItems Items",style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.regular),),
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.grey,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
