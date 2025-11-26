import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_mate/core/shared/screen/edit_profile_screen.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [Colors.blue.shade300, Colors.blue.shade500],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        color: Color(0xff6F86FF),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurStyle: BlurStyle.inner,
            blurRadius: 100,
            // spreadRadius: 1,
            color: const Color.fromARGB(200, 0, 0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          // Profile Picture
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?u=a042581f4e29026704d',
            ), // Dummy image
          ),
          const SizedBox(width: 16),
          // User Info
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kishan Chauhan',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'xyz@rku.ac.in',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          // Edit Icon
          IconButton(
            onPressed: () {
              Get.to(() => EditProfileScreen());
            },
            icon: const Icon(Icons.edit, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
