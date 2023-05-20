import 'package:costine/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: edge),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Text(
              'Let\'s setup your account!',
              style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: darkBlueColor),
            ),
            const SizedBox(
              height: 36,
            ),
            Wrap(
              children: [
                Text(
                  'Welcome to Your Personalized Finance Hub! Keep Your Account Safe and Sound by Adding a Security Pin, and Stay on Track with Your Spending Goals by Setting Up a Monthly Budget. Let\'s Get Started!',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: darkBlueColor),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: const BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Center(
                  child: Text(
                    'Let\'s Go!',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      )),
    );
  }
}
