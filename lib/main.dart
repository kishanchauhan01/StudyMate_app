import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/managers/profile_manager.dart'; 
import 'core/managers/upload_manager.dart'; 

import 'package:study_mate/core/shared/screen/edit_profile_screen.dart';
import 'package:study_mate/core/shared/screen/my_uploads_screen.dart';
import 'package:study_mate/core/shared/screen/saved_material_screen.dart';
import 'package:study_mate/core/shared/screen/upload_material_screen.dart';

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
   runApp(
    // Use MultiProvider to provide all your managers to the app
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileManager()),
        ChangeNotifierProvider(create: (_) => UploadManager()),
      ],
      child: const Home(),
    ),
  );
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
      // home: EditProfileScreen(),
      // home: MyUploadsScreen(),
      home: UploadMaterialScreen(),
      // home: AddSubjectPage(),
      // home: SavedMaterialsScreen(),
    );
  }
}
