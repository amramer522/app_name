import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastView {
  OverlayState? overlayState;
  OverlayEntry? _overlayEntry;
  bool _isVisible = false;

  ToastView._();

  static ToastView? _toastView;

  static ToastView getInstance() {
    if (_toastView == null) {
      return ToastView._();
    }
    return _toastView!;
  }

  void createView(
      context,
      String msg,
      int duration,
      int gravity,
      Color background,
      Color textColor,
      double backgroundRadius,
      Border border) async {
    dismiss();
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
          top: gravity == 2 ? 50 : null,
          bottom: gravity == 0 ? 100 : null,
          child: Material(
            color: Colors.transparent,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(backgroundRadius),
                    border: border,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/app_logo.png",height: 25.h,width: 25.h,),
                      // const FlutterLogo(),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(msg,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(fontSize: 15, color: textColor)),
                    ],
                  ),
                )),
          )),
    );
    _isVisible = true;
    overlayState!.insert(_overlayEntry!);
    await Future.delayed(Duration(seconds: duration));
    dismiss();
  }

  void dismiss() {
    if (_isVisible) {
      _isVisible = false;
      _overlayEntry?.remove();
    }
  }
}
