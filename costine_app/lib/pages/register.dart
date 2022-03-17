import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          Image.asset(
            'assets/banner.png',
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 85,
                ),
                Text(
                  'Costine',
                  style: GoogleFonts.inter(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Register',
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      color: Color(0xffCCC1FF),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Register to manage your expenses',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Color(0xffCCC1FF),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 49),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 38,
                        ),
                        Text(
                          'USERNAME',
                          style: GoogleFonts.inter(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'EMAIL',
                          style: GoogleFonts.inter(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'PASSWORD',
                          style: GoogleFonts.inter(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color(0xff553C8B)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 107, vertical: 13),
                            child: Text(
                              'Register',
                              style: GoogleFonts.inter(
                                  color: Color(0xffffffff),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
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
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
