import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:study_mate/features/auth/models/institute_model.dart';
import 'package:study_mate/features/auth/models/user_model.dart';

class AuthDataController extends GetxController {
  final storage = GetStorage();

  var user = Rxn<UserModel>();
  var institute = Rxn<InstituteModel>();

  @override
  void onInit() {
    super.onInit();
    loadUserFromStorage();
  }

  void saveUser(UserModel userModel, InstituteModel instituteModel) {
    user.value = userModel;
    institute.value = instituteModel;

    storage.write("user", userModel.toJson());
    storage.write("institute", instituteModel.toJson());
  }

  void loadUserFromStorage() {
    final userData = storage.read("user");
    final instituteData = storage.read("institute");

    if (userData != null && instituteData != null) {
      user.value = UserModel.fromJson(userData);
      institute.value = InstituteModel.fromJson(instituteData);
    }
  }

  void logout() {
    storage.remove("user");
    storage.remove("institute");

    user.value = null;
    institute.value = null;
  }
}
