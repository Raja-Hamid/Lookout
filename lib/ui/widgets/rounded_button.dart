import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundedButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(412, 915), minTextAdapt: true);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(350.w, 50.h),
        backgroundColor: const Color(0xFFFFC107),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            color: const Color(0xFF101417),
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Raleway'),
      ),
    );
  }
}
