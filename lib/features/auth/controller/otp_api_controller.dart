import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:study_mate/features/auth/controller/registration_data_controller.dart';

class OtpApiController extends GetxController {
  final reg = Get.find<RegistrationController>();

  Future<bool> sentOTP() async {
    final adminEmail = reg.registrationData.value.adminEmail;

    try {
      final response = await http.post(
        Uri.parse("http://10.50.127.35:8080/api/v1/auth/sentOTP"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(adminEmail),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        reg.setOtpRefId(data["otpRefId"]);
        
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
