import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:study_mate/features/auth/controller/registration_data_controller.dart';

class OtpApiController extends GetxController {
  final reg = Get.find<RegistrationController>();

  Future<(bool success, String message)> sentOTP() async {
    final requestBody = {"adminEmail": reg.registrationData.value.adminEmail};

    print("--------------------------------yes-----------------------------");
    print(requestBody);

    try {
      final response = await http.post(
        Uri.parse("http://10.50.127.35:8080/api/v1/auth/sentOTP"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      final data = jsonDecode(response.body);
      print(data);
      print("-----------------------------here");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("-----------------------------here111111111");
        reg.setOtpRefId(data["data"]);
        print(data["message"].toString());

        return (true, data["message"].toString());
      } else {
        return (false, data["message"].toString());
        ;
      }
    } catch (e) {
      print("Error: $e");
      return (false, "Error: $e");
    }
  }
}
