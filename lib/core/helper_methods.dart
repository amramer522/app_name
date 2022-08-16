import 'package:flutter/material.dart';

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
