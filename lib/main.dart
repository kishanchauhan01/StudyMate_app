import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_mate/core/shared/screen/edit_profile.dart';
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
  ]).then((_) {
    runApp(const Home());
  });
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 147, 221),
          brightness: Brightness.light,
        ),
      ),
      // home: WidgetTree(),
      home:EditProfilePage()
    );
  }
}
