import 'package:flutter/material.dart';

import '../shared/toast.dart';

final navigator = GlobalKey<NavigatorState>();

Future<dynamic> navigateTo({page, bool leaveHistory = true}) {
  return Navigator.pushAndRemoveUntil(
      navigator.currentContext!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      (route) => leaveHistory);
}

Color getStatusTextColor(String status) {
  Color color;
  switch (status.toLowerCase()) {
    case "waiting":
      color = const Color(0xffE3AC6A);
      break;
    case "active":
      color = const Color(0xff04A919);
      break;
    case "pending":
      color = const Color(0xff797979);
      break;
    case "processing":
      color = const Color(0xffEAA093);
      break;
    case "delivered":
      color = const Color(0xff00C52F);
      break;
    case "canceled":
      color = const Color(0xffC61B01);
      break;
    case "expired":
      color = const Color(0xffD72000);
      break;
    default:
      color = Colors.grey;
  }
  return color;
}

void showToast(
    context, {
      required String msg,
      int duration = 2,
      int gravity = 0,
      Color backgroundColor = const Color(0xff000000),
      Color textColor = Colors.white,
      double backgroundRadius = 20,
    }) {
  ToastView.getInstance().createView(context, msg, duration, gravity, backgroundColor, textColor,
      backgroundRadius, Border.all(color: Colors.transparent));
}
