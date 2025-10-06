import 'package:flutter/material.dart';

class SubjectGridItem extends StatelessWidget {
  final String subjectName;
  final Widget icon;

  const SubjectGridItem({
    super.key,
    required this.subjectName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 30, backgroundColor: Colors.white, child: icon),
        const SizedBox(height: 15),
        Text(subjectName, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 15),
      ],
    );
  }
}
