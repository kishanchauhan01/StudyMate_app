import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../managers/profile_manager.dart';
import '../../common_widgets/custom_form_fields.dart'; // Import the new common widgets

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = context.watch<ProfileManager>();
    final managerReader = context.read<ProfileManager>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        // ... (Your AppBar code is unchanged)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=18'),
              ),
            ),
            const SizedBox(height: 32),

            CustomFormField(
              label: 'Your name',
              controller: manager.nameController,
            ),
            const SizedBox(height: 24),

            CustomFormField(
              label: 'Your email',
              controller: manager.emailController,
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: CustomDropdownFormField(
                    label: 'Sem',
                    value: manager.selectedSemester,
                    items: manager.semesters,
                    onChanged: managerReader.updateSemester,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomDropdownFormField(
                    label: 'Branch',
                    value: manager.selectedBranch,
                    items: manager.branches,
                    onChanged: managerReader.updateBranch,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            CustomDropdownFormField(
              label: 'Department',
              value: manager.selectedDepartment,
              items: manager.departments,
              onChanged: managerReader.updateDepartment,
            ),
            const SizedBox(height: 40),

            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  managerReader.updateProfile(); // Call manager's logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile Updated Successfully!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF836FFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Update Profile', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}