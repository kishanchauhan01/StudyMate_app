import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileManager extends GetxController {
  // Text controllers
  final nameController = TextEditingController(text: 'Kishan Chauhan');
  final emailController = TextEditingController(text: 'xyz@rku.ac.in');

  // Dropdown lists
  final List<String> semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final List<String> branches = ['CE', 'IT', 'ME', 'EE', 'CIVIL', 'EC'];
  final List<String> departments = ['B.Tech', 'M.Tech', 'Diploma', 'MBA'];

  // Reactive selected values
  var selectedSemester = '5'.obs;
  var selectedBranch = 'CE'.obs;
  var selectedDepartment = 'B.Tech'.obs;

  // Update functions
  void updateSemester(String? value) {
    selectedSemester.value = value ?? selectedSemester.value;
  }

  void updateBranch(String? value) {
    selectedBranch.value = value ?? selectedBranch.value;
  }

  void updateDepartment(String? value) {
    selectedDepartment.value = value ?? selectedDepartment.value;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
