import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/theme/app_colors.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  TextEditingController otpTxtCtrl = TextEditingController();

  late String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FaIcon(FontAwesomeIcons.xmark, size: 20),
          ),
        ),
        title: Text(
          "Verify Institute",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Code is sent to registar@rku.ac.in",
                style: TextStyle(
                  color: AppColors.txtGrey,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: otpTxtCtrl,
                  onChanged: (value) {
                    print(otpTxtCtrl.text);
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 60,
                    fieldWidth: 50,
                    inactiveColor: Colors.grey.shade300,
                    activeColor: Colors.black,
                    selectedColor: Colors.blue,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              AppButton(
                text: "Verify and register institute",
                onPressed: otpTxtCtrl.text.length == 4
                    ? () {
                        //Navigate to the home screen
                      }
                    : null,
                isPrimary: true,
                width: MediaQuery.of(context).size.width * 0.80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
