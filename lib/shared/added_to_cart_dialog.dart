import '/../core/helper_methods.dart';
import '/../screens/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/fonts.gen.dart';

showAddToCartSheet(context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.r), topLeft: Radius.circular(16.r))),
    builder: (context) => const AddedToCartDialog(),
  );
}

class AddedToCartDialog extends StatelessWidget {
  const AddedToCartDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.clear)),
          ),
          Icon(
            Icons.done,
            size: 60.sp,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text("Done",
              style: TextStyle(
                  fontSize: 25.sp,
                  fontFamily: FontFamily.bold,
                  color: const Color(0xff090808))),
          SizedBox(
            height: 5.h,
          ),
          Text("Successfully added to your cart",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: FontFamily.regular,
                  color: const Color(0xff090808))),
          SizedBox(
            height: 56.h,
          ),
          ElevatedButton(
              onPressed: () {
                navigateTo(
                    page: HomeScreen(
                      currentIndex: 2,
                    ),
                    leaveHistory: false);
              },
              child: const Text("Open cart")),
          SizedBox(
            height: 49.h,
          ),
        ],
      ),
    );
  }
}
