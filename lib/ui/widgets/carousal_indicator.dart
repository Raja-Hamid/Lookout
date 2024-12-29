import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarousalIndicator extends StatelessWidget {
  final Color activeColor;
  final Color inactiveColor;
  final double activeWidth;
  final double inactiveWidth;
  final int currentPage;
  final int itemCount;

  const CarousalIndicator({
    super.key,
    required this.activeColor,
    required this.inactiveColor,
    required this.activeWidth,
    required this.inactiveWidth,
    required this.currentPage,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(412, 915), minTextAdapt: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            height: 4.h,
            width: currentPage == index ? activeWidth : inactiveWidth,
            decoration: BoxDecoration(
              color: currentPage == index ? activeColor : inactiveColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
          );
        },
      ),
    );
  }
}
