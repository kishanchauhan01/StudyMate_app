import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                  image: "assets/images/welcome_page/illustration_1.png",
                  title: "Welcome to StudyMate",
                  description:
                      "Your all-in-one platform for notes, projects, roadmaps, and more.",
                  pageCount: 1,
                ),
                OnBoard(
                  image: "assets/images/welcome_page/illustration_2.png",
                  title: "Learn. Share. Grow.",
                  description:
                      "Students and faculty can upload and access study materials, past papers, e-books, and helpful resources in one place.",
                  pageCount: 2,
                ),
                OnBoard(
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

  const OnBoard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.pageCount,
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
              child: Text("Skip", style: TextStyle(color: Color(0xFF858597))),
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
              style: TextStyle(fontSize: 14, color: Color(0xFF858597)),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
