import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class ItemEditorActions extends StatelessWidget {
  final String imageName,title;
  final VoidCallback onPress;
  const ItemEditorActions({Key? key,required this.imageName,required this.title,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Column(
          children: [
            SvgPicture.asset("assets/icons/$imageName.svg"),
            SizedBox(height: 5.h,),
            Text(title,style: TextStyle(color: Colors.white),),
            SizedBox(height: 8.h,),
          ],
        ),
      ),
    );
  }
}
