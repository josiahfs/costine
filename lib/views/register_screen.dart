import 'package:costine/controller/auth_controller.dart';
import 'package:costine/theme.dart';
import 'package:costine/views/login_screen.dart';
import 'package:costine/views/onboarding/welcome_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool tnc = false.obs;

  final RxBool obscureText = true.obs;
  final _formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  void togglePassword() {
    obscureText.value = !obscureText.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: edge),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up',
                          style: GoogleFonts.inter(
                            color: darkBlueColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: blueColor,
                            ),
                          ),
                          child: TextFormField(
                              controller: nameController,
                              cursorColor: blueColor,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                contentPadding: EdgeInsets.all(20.0),
                                border: InputBorder.none,
                              ),
                              validator: (val) => val!.isEmpty
                                  ? 'Nama tidak boleh kosong.'
                                  : null),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: blueColor,
                            ),
                          ),
                          child: TextFormField(
                              controller: emailController,
                              cursorColor: blueColor,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                contentPadding: EdgeInsets.all(20.0),
                                border: InputBorder.none,
                              ),
                              validator: (val) => val!.isEmpty
                                  ? 'Email tidak boleh kosong.'
                                  : null),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: blueColor,
                            ),
                          ),
                          child: Obx(
                            () => TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              controller: passwordController,
                              cursorColor: blueColor,
                              obscureText: obscureText.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding: const EdgeInsets.all(20.0),
                                suffixIcon: InkWell(
                                  onTap: togglePassword,
                                  child: Icon(
                                    obscureText.value
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: grayColor,
                                  ),
                                ),
                              ),
                              validator: (val) => val!.isEmpty
                                  ? 'Password tidak boleh kosong.'
                                  : null,
                              // onSaved: (val) => _password = val!,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 34, //<-- SEE HERE
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  side: const BorderSide(
                                      color: blueColor, width: 1.5),
                                  activeColor: blueColor,
                                  checkColor: whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  value: tnc.value,
                                  onChanged: (value) {
                                    tnc.value = value!;
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Wrap(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'By signing up, you agree to the ',
                                          style: GoogleFonts.inter(
                                              color: darkBlueColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text:
                                              'Terms of Service and Privacy Policy',
                                          style: GoogleFonts.inter(
                                              color: blueColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // Add your Terms of Service logic here
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              AuthController.instance.register(
                                emailController.text.trim(),
                                nameController.text.trimRight(),
                                passwordController.text.trim(),
                              );
                              Get.to(() => WelcomeScreen());
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            decoration: const BoxDecoration(
                                color: blueColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'or',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: grayColor),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () {
                            AuthController.instance.loginWithGoogle();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                border: Border.all(
                                    color: lightGrayColor, width: 2.5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/google.png',
                                  width: 32,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Log In with Google',
                                  style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: darkBlueColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: grayColor,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => LoginScreen());
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
