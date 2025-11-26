import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/common_widgets/custome_text_field.dart';
import 'package:study_mate/core/shared/screen/home_screen.dart';
import 'package:study_mate/core/theme/app_colors.dart';
import 'package:study_mate/features/auth/controller/auth_data_controller.dart';
import 'package:study_mate/features/auth/models/institute_model.dart';
import 'package:study_mate/features/auth/models/user_model.dart';
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
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? userEmailError;
  String? userNameError;
  String? instituteCodeError;
  String? passwordError;
  String? confirmPasswordError;

  bool validateForm() {
    setState(() {
      userEmailError = emailController.text.isEmpty
          ? "Email is required"
          : null;
      userNameError = nameController.text.isEmpty ? "Name is required" : null;
      instituteCodeError = institueCodeController.text.isEmpty
          ? "Institute code is required"
          : null;
      passwordError = passwordController.text.isEmpty
          ? "Password is required"
          : null;

      if (confirmPasswordController.text.isEmpty) {
        confirmPasswordError = "Confirm you password";
      } else if (passwordController.text != confirmPasswordController.text) {
        confirmPasswordError = "Password does not match";
      } else {
        confirmPasswordError = null;
      }
    });

    return userEmailError == null &&
        userNameError == null &&
        passwordError == null &&
        confirmPasswordError == null;
  }

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

            if (userEmailError != null)
              Text(
                userEmailError!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),

            CustomeTextField(
              lable: "Your Name",
              hintText: "Elone Musk",
              controller: nameController,
              obsecureText: false,
            ),

            if (userNameError != null)
              Text(
                userNameError!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),

            CustomeTextField(
              lable: "Your Institute Code",
              hintText: "Space-X",
              controller: institueCodeController,
              obsecureText: false,
            ),
            if (instituteCodeError != null)
              Text(
                instituteCodeError!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),

            CustomeTextField(
              lable: "Password",
              hintText: "",
              controller: passwordController,
              obsecureText: true,
            ),

            if (passwordError != null)
              Text(
                passwordError!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),

            CustomeTextField(
              lable: "Confirm Password",
              hintText: "",
              controller: confirmPasswordController,
              obsecureText: true,
            ),

            if (confirmPasswordError != null)
              Text(
                confirmPasswordError!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),

            SizedBox(height: 10),

            AppButton(
              text: "Create Account",
              onPressed: () async {
                if (validateForm()) {
                  final data = {
                    "email": emailController.text,
                    "name": nameController.text,
                    "password": passwordController.text,
                    "instituteCode": institueCodeController.text,
                  };
                  Get.dialog(
                    Center(child: CircularProgressIndicator()),
                    barrierDismissible: false,
                  );
                  print("here2---------------------------------------adfadsf");

                  try {
                    final response = await http.post(
                      Uri.parse(
                        "https://studymate-backend-4nhe.onrender.com/api/v1/auth/userSignup",
                      ),
                      headers: {"Content-Type": "application/json"},
                      body: jsonEncode(data),
                    );

                    final resData = jsonDecode(response.body);
                    print("---------------------------here");
                    print(resData);
                    //close the loader
                    Get.back();

                    if (response.statusCode == 200) {
                      final userJson = resData["data"]["newUser"];
                      final instituteJson = resData["data"]["institute"];

                      final userModel = UserModel.fromJson(userJson);
                      final instituteModel = InstituteModel.fromJson(
                        instituteJson,
                      );

                      final auth = Get.find<AuthDataController>();
                      auth.saveUser(userModel, instituteModel);

                      Get.offAll(() => HomeScreen());

                      Future.delayed(Duration(milliseconds: 300), () {
                        Get.snackbar("Success", resData["message"]);
                      });
                    } else {
                      Get.back();
                      Get.snackbar(
                        "Error",
                        resData["message"] ?? "Something went wrong",
                      );
                    }
                  } catch (e) {
                    Get.back();
                    print(e);
                    Get.snackbar("Error", "Something went wrong");
                  }
                }
              },
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
