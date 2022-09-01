import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/fonts.gen.dart';

class AppInput extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final bool isRequired;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final TextInputType keyBoardType;

  const AppInput(
      {Key? key,
      required this.label,
      this.hint = "",
      this.isPassword = false,
      this.isRequired = false,
      this.keyBoardType = TextInputType.text,
      this.controller,
      this.labelStyle})
      : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label + (widget.isRequired ? " *" : ''),
              style: widget.labelStyle ??
                  TextStyle(fontSize: 15.sp, fontFamily: FontFamily.regular)),
          TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? isHidden : false,
            decoration: InputDecoration(
                hintText: widget.hint,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        child: Icon(isHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                        onTap: () {
                          isHidden = !isHidden;
                          setState(() {});
                        })
                    : null),
            keyboardType: widget.keyBoardType,
          )
        ],
      ),
    );
  }
}
