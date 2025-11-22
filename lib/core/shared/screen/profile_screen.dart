import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/profile_header_card.dart';
import 'package:study_mate/core/common_widgets/profile_menu_list_item.dart';
import 'package:study_mate/core/shared/screen/edit_profile_screen.dart';
import 'package:study_mate/core/shared/screen/my_uploads_screen.dart';
import 'package:study_mate/core/shared/screen/saved_material_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Header
            const ProfileHeaderCard(),
            const SizedBox(height: 24),

            // Account Menu Section
            _buildMenuSection(
              context,
              children: [
                ProfileMenuListItem(
                  icon: Icons.person_outline,
                  title: 'My Account',
                  subtitle: 'View your profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  },
                ),
                ProfileMenuListItem(
                  icon: Icons.cloud_upload_outlined,
                  title: 'My Uploads',
                  subtitle: 'View your uploaded materials',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyUploadsScreen(),
                      ),
                    );
                  },
                ),
                ProfileMenuListItem(
                  icon: Icons.bookmark_border,
                  title: 'Saved Materials',
                  subtitle: 'View all your saved materials',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SavedMaterialsScreen(),
                      ),
                    );
                  },
                ),
                ProfileMenuListItem(
                  icon: Icons.logout,
                  title: 'Log Out',
                  subtitle: 'You will be logged out from the app',
                  onTap: () {},
                  isLogout: true,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // More Section
            const Text(
              'More',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            _buildMenuSection(
              context,
              children: [
                ProfileMenuListItem(
                  icon: Icons.favorite_border,
                  title: 'About App',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build menu sections with a card background
  Widget _buildMenuSection(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}
