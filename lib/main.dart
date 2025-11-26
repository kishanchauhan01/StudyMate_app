import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:study_mate/core/managers/profile_manager.dart';
import 'package:study_mate/features/auth/controller/auth_data_controller.dart';
import 'package:study_mate/widget_tree.dart';

void main() {
  // Ensure that Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    //transparent mobile status bar
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // fully transparent
      statusBarIconBrightness:
          Brightness.dark, // dark icons for light background
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    await GetStorage.init();
    Get.put(ProfileManager());
    Get.put(AuthDataController()); // Global instance

    runApp(Home());
  });
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 147, 221),
          brightness: Brightness.light,
        ),
      ),

      home: WidgetTree(),
    );
  }
}
