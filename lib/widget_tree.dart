import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:study_mate/core/shared/screen/navigation_screen.dart';
import 'package:study_mate/features/auth/models/user_model.dart';
import 'package:study_mate/features/auth/screens/login_screen.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final userJson = box.read("user");

    if (userJson != null) {
      final user = UserModel.fromJson(Map<String, dynamic>.from(userJson));
      if (user.isLoggedIn) {
        return NavigationScreen();
      }
    }

    return LoginScreen();
  }
}
