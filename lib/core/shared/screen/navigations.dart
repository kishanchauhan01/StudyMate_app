import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/custom_bottom_nav_bar.dart';
import 'package:study_mate/core/shared/screen/home_screen.dart';
import 'package:study_mate/core/shared/screen/profile_screen.dart';
import 'package:study_mate/core/shared/screen/search_screen.dart';

class Navigations extends StatefulWidget {
  const Navigations({super.key});

  @override
  State<Navigations> createState() => _NavigationsState();
}

class _NavigationsState extends State<Navigations> {
  int _currentIndex = 0;

  // 👇 List of pages
  final List<Widget> _pages = const [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _pages[_currentIndex], 
      bottomNavigationBar: CustomBottomNavBar(
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
