import 'package:flutter/material.dart';

class ProfileManager extends ChangeNotifier {
  final nameController = TextEditingController(text: 'Kishan Chauhan');
  final emailController = TextEditingController(text: 'xyz@rku.ac.in');

  final List<String> semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final List<String> branches = ['CE', 'IT', 'ME', 'EE', 'CIVIL', 'EC'];
  final List<String> departments = ['B.Tech', 'M.Tech', 'Diploma', 'MBA'];

  String? _selectedSemester = '5';
  String? _selectedBranch = 'CE';
  String? _selectedDepartment = 'B.Tech';

  String? get selectedSemester => _selectedSemester;
  String? get selectedBranch => _selectedBranch;
  String? get selectedDepartment => _selectedDepartment;

  void updateSemester(String? newValue) {
    _selectedSemester = newValue;
    notifyListeners();
  }

  void updateBranch(String? newValue) {
    _selectedBranch = newValue;
    notifyListeners();
  }

  void updateDepartment(String? newValue) {
    _selectedDepartment = newValue;
    notifyListeners();
  }
  
  void updateProfile() {
    // In a real app, you would save this data to a database or API
    print("--- UPDATING PROFILE ---");
    print("Name: ${nameController.text}");
    print("Email: ${emailController.text}");
    print("Semester: $_selectedSemester");
    print("Branch: $_selectedBranch");
    print("Department: $_selectedDepartment");
    print("--- PROFILE SAVED ---");
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}