import 'package:get/get.dart';
import 'package:study_mate/features/auth/models/registration_model.dart';

class RegistrationController extends GetxController {
  var registrationData = RegistrationModel().obs;

  void setInstituteData({
    required String name,
    required String email,
    required String contact,
    required String type,
    required String address,
  }) {
    registrationData.update((data) {
      data!.instituteName = name;
      data.instituteEmail = email;
      data.instituteContact = contact;
      data.instituteType = type;
      data.instituteAddress = address;
    });
  }

  void setAdminData({
    required String name,
    required String email,
    required String password,
  }) {
    registrationData.update((data) {
      data!.adminName = name;
      data.adminEmail = email;
      data.adminPassword = password;
    });
  }

  void setOtpRefId(String id) {
    registrationData.update((data) {
      data!.otpRefId = id;
    });
  }
}


final regController = Get.put(RegistrationController());

