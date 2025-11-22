import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/common_widgets/custome_text_field.dart';
import 'package:study_mate/core/theme/app_colors.dart';
import 'package:study_mate/features/auth/controller/otp_api_controller.dart';
import 'package:study_mate/features/auth/controller/registration_data_controller.dart';
import 'package:study_mate/features/auth/screens/otp_verify_screen.dart';

class InstituteAdminScreen extends StatefulWidget {
  const InstituteAdminScreen({super.key});

  @override
  State<InstituteAdminScreen> createState() =>
      _InstituteRegistrationScreenState();
}

class _InstituteRegistrationScreenState extends State<InstituteAdminScreen> {
  TextEditingController adminNameController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();
  TextEditingController adminConfirmPassowrdController =
      TextEditingController();

  final regApi = Get.put(OtpApiController());
  final reg = Get.find<RegistrationController>();

  String? adminNameError;
  String? adminEmailError;
  String? adminPasswordError;
  String? adminConfirmPasswordError;

  bool validateForm() {
    setState(() {
      adminNameError = adminNameController.text.isEmpty
          ? "Name is required"
          : null;
      adminEmailError = adminEmailController.text.isEmpty
          ? "Email is required"
          : null;
      adminPasswordError = adminPasswordController.text.isEmpty
          ? "Password is required"
          : null;

      if (adminConfirmPassowrdController.text.isEmpty) {
        adminConfirmPasswordError = "Confirm your password";
      } else if (adminPasswordController.text !=
          adminConfirmPassowrdController.text) {
        adminConfirmPasswordError = "Password does not match";
      } else {
        adminConfirmPasswordError = null;
      }
    });

    return adminNameError == null &&
        adminEmailError == null &&
        adminPasswordError == null &&
        adminConfirmPasswordError == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Institute Admin"), centerTitle: true),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomeTextField(
                  lable: "Name",
                  hintText: "your name",
                  obsecureText: false,
                  controller: adminNameController,
                ),
                if (adminNameError != null)
                  Text(
                    adminNameError!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),

                CustomeTextField(
                  lable: "Email",
                  hintText: "your email",
                  obsecureText: false,
                  controller: adminEmailController,
                ),
                if (adminEmailError != null)
                  Text(
                    adminEmailError!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),

                CustomeTextField(
                  lable: "Password",
                  hintText: "",
                  obsecureText: true,
                  controller: adminPasswordController,
                ),
                if (adminPasswordError != null)
                  Text(
                    adminPasswordError!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),

                CustomeTextField(
                  lable: "Confirm Password",
                  hintText: "",
                  obsecureText: true,
                  controller: adminConfirmPassowrdController,
                ),
                if (adminConfirmPasswordError != null)
                  Text(
                    adminConfirmPasswordError!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),

                SizedBox(height: 20),

                AppButton(
                  width: 300,
                  text: "Submit",
                  onPressed: () async {
                    if (validateForm()) {
                      regController.setAdminData(
                        name: adminNameController.text,
                        email: adminEmailController.text,
                        password: adminPasswordController.text,
                      );
                      _showDialog(context);
                      // ⬅ call API here
                    }
                  },
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(Icons.info),
          content: Text(
            "By Clicking Done we will send OTP to your institute email",
            style: TextStyle(color: AppColors.txtGrey, fontSize: 16),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onPressed: () async {
                    final (success, message) = await regApi.sentOTP();

                    if (success) {
                      Get.to(OtpVerifyScreen());
                    } else {
                      Get.snackbar("Error", message);
                    }
                  },
                  text: "Done",
                  isPrimary: true,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
