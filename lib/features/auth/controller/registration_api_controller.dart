import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:study_mate/features/auth/controller/registration_data_controller.dart';

class RegistrationApiController extends GetxController {
  final reg = Get.find<RegistrationController>();

  Future<(bool success, String message)> submitRegistration(String otp) async {
    final baseBody = reg.registrationData.value.toJson();

    final requestBody = {
      ...baseBody,
      "otp": otp,
      "otpRefId": reg.registrationData.value.otpRefId,
    };

    try {
      final response = await http.post(
        Uri.parse("http://10.50.127.35:8080/api/v1/auth/instituteRegister"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return (true, data["message"].toString());
      } else {
        return (false, data["message"].toString());
      }
    } catch (e) {
      print("Error: $e");
      return (false, "Error: $e");
    }
  }
}
