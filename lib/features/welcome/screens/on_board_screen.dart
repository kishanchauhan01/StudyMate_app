import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:study_mate/core/common_widgets/app_button.dart';
import 'package:study_mate/core/theme/app_colors.dart';
import 'package:study_mate/features/auth/screens/institute_registration.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,

              children: [
                OnBoard(
                  controller: _controller,
                  image: "assets/images/welcome_page/illustration_1.png",
                  title: "Welcome to StudyMate",
                  description:
                      "Your all-in-one platform for notes, projects, roadmaps, and more.",
                  pageCount: 1,
                ),
                OnBoard(
                  controller: _controller,
                  image: "assets/images/welcome_page/illustration_2.png",
                  title: "Learn. Share. Grow.",
                  description:
                      "Students and faculty can upload and access study materials, past papers, e-books, and helpful resources in one place.",
                  pageCount: 2,
                ),
                OnBoard(
                  controller: _controller,
                  image: "assets/images/welcome_page/illustration_3.png",
                  title: "Join Your Institute",
                  description:
                      "Register your institute or log in to connect with your academic community. Access shared resources, manage study materials, and collaborate effortlessly.",
                  pageCount: 3,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int pageCount;
  final PageController controller;

  const OnBoard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.pageCount,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (pageCount == 1)
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.10,
              ),
              child: GestureDetector(
                onTap: () => controller.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                ),
                child: Text("Skip", style: TextStyle(color: AppColors.txtGrey)),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(height: 30),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.txtGrey),
            ),

            SizedBox(height: 30),

            if (pageCount == 3) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    text: "Institute Register",
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => InstituteProgressScreen(),
                      //   ),
                      // );
                    },
                    isPrimary: true,
                  ),

                  SizedBox(width: 10),

                  AppButton(
                    text: "Join Institute",
                    onPressed: () {},
                    isPrimary: false,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
