import 'package:flutter/material.dart';
import 'package:study_mate/views/widget_tree.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0x00cdecfe),
          brightness: Brightness.light,
        ),
      ),
      home: WidgetTree(),
    );
  }
}
