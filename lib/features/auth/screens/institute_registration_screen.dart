import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/common_widgets/custome_text_field.dart';
import 'package:study_mate/features/auth/screens/institute_admin_screen.dart';

class InstituteRegistrationScreen extends StatefulWidget {
  const InstituteRegistrationScreen({super.key});

  @override
  State<InstituteRegistrationScreen> createState() =>
      _InstituteRegistrationScreenState();
}

class _InstituteRegistrationScreenState
    extends State<InstituteRegistrationScreen> {
  TextEditingController instituteNameController = TextEditingController();
  TextEditingController instituteEmailController = TextEditingController();
  TextEditingController instituteTypeController = TextEditingController();
  TextEditingController instituteContactController = TextEditingController();
  TextEditingController instituteAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Institute"), centerTitle: true),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomeTextField(
                  lable: "Institute Name",
                  hintText: "your institute name",
                  obsecureText: false,
                  controller: instituteNameController,
                ),

                CustomeTextField(
                  lable: "Institute Email",
                  hintText: "your institute email",
                  obsecureText: false,
                  controller: instituteEmailController,
                ),
                CustomeTextField(
                  lable: "Institute Type",
                  hintText: "School/Collage",
                  obsecureText: false,
                  controller: instituteTypeController,
                ),
                CustomeTextField(
                  lable: "Institute Contact",
                  hintText: "+91 58461 5489",
                  obsecureText: false,
                  controller: instituteContactController,
                ),
                CustomeTextField(
                  lable: "Institute Address",
                  hintText: "Rajkot, Gujrat",
                  obsecureText: false,
                  controller: instituteAddressController,
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("* ", style: TextStyle(color: Colors.red)),
                    Expanded(
                      child: Text(
                        "A unique code will be generate for your institute after completing the registration",
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                AppButton(
                  width: 300,
                  text: "Next",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InstituteAdminScreen(),
                      ),
                    );
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
}
