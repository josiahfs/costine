import 'package:costine/theme.dart';
import 'package:costine/views/onboarding/onboarding1.dart';
import 'package:costine/views/onboarding/onboarding2.dart';
import 'package:costine/views/onboarding/onboarding3.dart';
import 'package:costine/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = index == 2;
                });
              },
              children: const [Onboarding1(), Onboarding2(), Onboarding3()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: edge),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const ScaleEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: lightBlueColor,
                          activeDotColor: darkBlueColor,
                          spacing: 12,
                          scale: 2.3,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: Text(
                          onLastPage ? 'Next' : 'Skip',
                          style: GoogleFonts.inter(
                              color: darkBlueColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
