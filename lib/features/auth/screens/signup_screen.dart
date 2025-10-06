import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/common_widgets/custome_text_field.dart';
import 'package:study_mate/core/theme/app_colors.dart';
import 'package:study_mate/features/auth/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  const Text(
                    "SignUp",
                    style: TextStyle(color: AppColors.txtBlack, fontSize: 36.0),
                  ),
                  SizedBox(height: 10.0),
                  const Text(
                    "👋 Welcome to StudyMate",
                    style: TextStyle(color: AppColors.txtGrey, fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: _SignUpFormState()),
        ],
      ),
    );
  }
}

class _SignUpFormState extends StatefulWidget {
  const _SignUpFormState();

  @override
  State<_SignUpFormState> createState() => _SignUpFormStateState();
}

class _SignUpFormStateState extends State<_SignUpFormState> {
  // textForm controller
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController institueCodeController = TextEditingController();
  TextEditingController facultyCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomeTextField(
              lable: "Your Email",
              hintText: "xyz@rku.ac.in",
              controller: emailController,
              obsecureText: false,
            ),

            CustomeTextField(
              lable: "Your Name",
              hintText: "Elone Musk",
              controller: nameController,
              obsecureText: false,
            ),

            CustomeTextField(
              lable: "Your Institute Code",
              hintText: "Space-X",
              controller: institueCodeController,
              obsecureText: false,
            ),

            CustomeTextField(
              lable: "Password",
              hintText: "",
              controller: passwordController,
              obsecureText: true,
            ),

            CustomeTextField(
              lable: "Confirm Password",
              hintText: "",
              controller: confirmPasswordController,
              obsecureText: true,
            ),

            SizedBox(height: 10),

            AppButton(
              text: "Create Account",
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Already have an account",
                      style: TextStyle(color: Colors.black87, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Text(
              "If your institute have a domain \nlogin with",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.txtGrey,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 8),

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
    );
  }
}
