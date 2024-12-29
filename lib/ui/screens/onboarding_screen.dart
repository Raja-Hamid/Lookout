import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookout/ui/widgets/carousal_indicator.dart';
import 'package:lookout/ui/widgets/rounded_button.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final List<String> _titles = [
    'Stay Safe. Stay Informed',
    'Explore Sightings Near You.',
    'Get Alerts. Share Reports'
  ];
  final List<String> _descriptions = [
    'Track real-time coyote sightings in your area to protect your family and pets. Together, we can create safer communities.',
    'Use our interactive map to track and filter coyote sightings. Stay alert with real-time updates tailored to your neighborhood.',
    'Receive instant notifications about nearby sightings, and help others by submitting your own reports with photos and details.'
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(412, 915), minTextAdapt: true);
    return Scaffold(
      backgroundColor: const Color(0xFF131619),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.w, 40.h, 25.w, 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                    child: _currentPage < _titles.length - 1
                        ? GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Skip ',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: Colors.white),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/arrow.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                              ],
                            ),
                            onTap: () {},
                          )
                        : null,
                  ),
                  SizedBox(height: 80.h),
                  Lottie.asset(
                    'assets/animations/wolf.json',
                    repeat: true,
                    width: 200.w,
                    height: 200.h,
                  ),
                  SizedBox(height: 70.h),
                  Text(
                    _titles[_currentPage],
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: Colors.white),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    _descriptions[_currentPage],
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 200.h),
                  CarousalIndicator(
                      activeColor: const Color(0xFFFFC107),
                      inactiveColor: Colors.grey.shade500,
                      activeWidth: 40.w,
                      inactiveWidth: 8.w,
                      currentPage: _currentPage,
                      itemCount: _titles.length),
                  SizedBox(height: 40.h),
                  RoundedButton(
                    title: _currentPage == _titles.length - 1
                        ? 'Get Started'
                        : 'Next',
                    onPressed: () {
                      setState(() {
                        if (_currentPage < _titles.length - 1) {
                          _currentPage++;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
