import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/common_widgets/custome_text_field.dart';

class InstituteAdminScreen extends StatefulWidget {
  const InstituteAdminScreen({super.key});

  @override
  State<InstituteAdminScreen> createState() =>
      _InstituteRegistrationScreenState();
}

class _InstituteRegistrationScreenState extends State<InstituteAdminScreen> {
  TextEditingController instituteNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Institute Super Admin"), centerTitle: true),
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
                  controller: instituteNameController,
                ),

                CustomeTextField(
                  lable: "Email",
                  hintText: "your email",
                  obsecureText: false,
                  controller: instituteNameController,
                ),
                CustomeTextField(
                  lable: "Password",
                  hintText: "",
                  obsecureText: true,
                  controller: instituteNameController,
                ),
                CustomeTextField(
                  lable: "Confirm Password",
                  hintText: "",
                  obsecureText: true,
                  controller: instituteNameController,
                ),

                SizedBox(height: 20),

                AppButton(
                  width: 300,
                  text: "Submit",
                  onPressed: () {},
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
