import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/common_widgets/custome_text_field.dart';
import 'package:study_mate/core/theme/app_colors.dart';
import 'package:study_mate/features/auth/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.24,
              decoration: BoxDecoration(color: AppColors.bgGrey),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "Go back",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.txtBlack,
                        fontSize: 36.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    const Text(
                      "👋 Welcome back",
                      style: TextStyle(
                        color: AppColors.txtGrey,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomeTextField(
                      lable: "Your Email",
                      hintText: "xyz@rku.ac.in",
                      controller: emailController,
                      obsecureText: false,
                    ),

                    CustomeTextField(
                      lable: "Password",
                      hintText: "",
                      controller: passwordController,
                      obsecureText: true,
                    ),

                    SizedBox(height: 20.0),

                    AppButton(
                      text: "Login",
                      onPressed: () {},
                      isPrimary: true,
                      width: MediaQuery.of(context).size.width * 0.90,
                    ),

                    SizedBox(height: 16.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          radius: 20.0,
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Don't have account ?",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.0),

                    Text(
                      "If your institute have a domain",
                      style: TextStyle(color: AppColors.txtGrey),
                    ),

                    SizedBox(height: 10.0),
                    InkWell(
                      radius: 50.0,
                      borderRadius: BorderRadius.circular(50.0),
                      onTap: () {
                        // To be implement
                        // print("tap on google");
                      },
                      child: Image.asset("assets/images/auth/google_auth.png"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
