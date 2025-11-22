import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:study_mate/widget_tree.dart';
import 'core/managers/profile_manager.dart';
import 'core/managers/upload_manager.dart';

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
      home: WidgetTree(),
    );
  }
}

