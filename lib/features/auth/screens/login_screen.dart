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
                      onPressed: () async {
                        final data = {
                          "email": emailController.text,
                          "password": passwordController.text,
                        };

                        Get.dialog(
                          Center(child: CircularProgressIndicator()),
                          barrierDismissible: false,
                        );

                        try {
                          final response = await http.post(
                            Uri.parse(
                              "http://10.12.203.35:8080/api/v1/auth/userLogin",
                            ),
                            headers: {"Content-Type": "application/json"},
                            body: jsonEncode(data),
                          );

                          final resData = jsonDecode(response.body);

                          print(
                            "------------------ FULL RESPONSE ------------------",
                          );
                          print(resData);

                          // Close loader
                          Get.back();

                          if (response.statusCode == 200) {
                            final userJson = resData["data"]["user"];
                            final instituteJson = resData["data"]["institute"];

                            print(
                              "------------------ USER JSON ------------------",
                            );
                            print(userJson); // ✔ Now correct

                            print(
                              "------------------ INSTITUTE JSON ------------------",
                            );
                            print(instituteJson);

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
