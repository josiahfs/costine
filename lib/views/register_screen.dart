import 'package:costine/controller/auth_controller.dart';
import 'package:costine/theme.dart';
import 'package:costine/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.93,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                              height: 15, //<-- SEE HERE
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  AuthController.instance.login(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );
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
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: whiteColor),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Forgot Password?',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: grayColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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
                        'Sign up',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: blueColor,
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 50,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
