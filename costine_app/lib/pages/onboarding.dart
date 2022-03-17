import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/onboard.png',
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.only(top: 210),
              child: Image.asset(
                'assets/people.png',
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Spend Smarter',
                    style: GoogleFonts.inter(
                        color: Color(0xff553C8B),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Save More',
                    style: GoogleFonts.inter(
                        color: Color(0xff553C8B),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff553C8B)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 130, vertical: 13),
                      child: Text(
                        'Save More',
                        style: GoogleFonts.inter(
                            color: Color(0xffffffff),
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account?',
                          style: GoogleFonts.inter(fontSize: 14),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Log in',
                          style: GoogleFonts.inter(
                              fontSize: 14, color: Color(0xff553C8B)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
