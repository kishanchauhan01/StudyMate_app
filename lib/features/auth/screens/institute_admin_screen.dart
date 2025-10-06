import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/common_widgets/custome_text_field.dart';
import 'package:study_mate/core/theme/app_colors.dart';
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

                CustomeTextField(
                  lable: "Email",
                  hintText: "your email",
                  obsecureText: false,
                  controller: adminEmailController,
                ),
                CustomeTextField(
                  lable: "Password",
                  hintText: "",
                  obsecureText: true,
                  controller: adminPasswordController,
                ),
                CustomeTextField(
                  lable: "Confirm Password",
                  hintText: "",
                  obsecureText: true,
                  controller: adminConfirmPassowrdController,
                ),

                SizedBox(height: 20),

                AppButton(
                  width: 300,
                  text: "Submit",
                  onPressed: () {
                    _showDialog(context);
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpVerifyScreen(),
                      ),
                    );
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
