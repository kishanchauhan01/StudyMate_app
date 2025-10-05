import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/common_widgets/custome_text_field.dart';
import 'package:study_mate/core/theme/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controller to manage which page is visible in the PageView
  final PageController _pageController = PageController();

  // Variable to keep track of the selected segment
  int _selectedSegment = 0;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: AppColors.bgGrey,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),

                const Text(
                  "Sign Up",
                  style: TextStyle(color: AppColors.txtBlack, fontSize: 34.0),
                ),

                SizedBox(height: 20),

                _buildSegmentControl(),
              ],
            ),
          ),

          Expanded(
            child: PageView(
              controller: _pageController,
              // This callbacke is called when the user swipes
              onPageChanged: (int page) {
                setState(() {
                  _selectedSegment = page;
                });
              },

              children: [
                // Page 1: Student form
                _SignUpFormState(userType: "Student"),
                // Page 2: Faculty Form
                _SignUpFormState(userType: "Faculty"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentControl() {
    return Container(
      padding: EdgeInsets.all(4.0),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSegmentButton('Student', 0),
            SizedBox(width: 6),
            Text(
              "|",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 6),
            _buildSegmentButton('Faculty', 1),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentButton(String text, int index) {
    bool isSelected = _selectedSegment == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          // This is called when segment is tapped
          setState(() {
            _selectedSegment = index;
          });

          // Animate the pageView to the selected page
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },

        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey[350] : Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),

          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.txtBlack : AppColors.txtGrey,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpFormState extends StatefulWidget {
  final String userType;
  const _SignUpFormState({required this.userType});

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

            if (widget.userType == "Faculty")
              CustomeTextField(
                lable: "Your Faculty code",
                hintText: "Efea-a-Bay",
                controller: facultyCodeController,
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
