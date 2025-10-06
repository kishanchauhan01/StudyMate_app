import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Controllers to manage the text in the input fields
  final _nameController = TextEditingController(text: 'Kishan Chauhan');
  final _emailController = TextEditingController(text: 'xyz@rku.ac.in');

  // Dummy data lists for the dropdown menus
  final List<String> _semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final List<String> _branches = ['CE', 'IT', 'ME', 'EE', 'CIVIL', 'EC'];
  final List<String> _departments = ['B.Tech', 'M.Tech', 'Diploma', 'MBA'];

  // Variables to hold the currently selected values from the dropdowns
  String? _selectedSemester = '5';
  String? _selectedBranch = 'CE';
  String? _selectedDepartment = 'B.Tech';

  @override
  void dispose() {
    // It's a good practice to dispose of controllers when the widget is removed
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A very light grey background color to match the design
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Padding for the entire page content
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile picture avatar
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.pink[100],
                // Placeholder image that looks similar to the one in the UI
                backgroundImage: const NetworkImage(
                  'https://i.pravatar.cc/150?img=18',
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Name field section
            _buildTextField(label: 'Your name', controller: _nameController),
            const SizedBox(height: 24),

            // Email field section
            _buildTextField(label: 'Your email', controller: _emailController),
            const SizedBox(height: 24),

            // Row for Sem and Branch dropdowns
            Row(
              children: [
                Expanded(
                  child: _buildDropdownField(
                    label: 'Sem',
                    value: _selectedSemester,
                    items: _semesters,
                    onChanged: (value) {
                      setState(() {
                        _selectedSemester = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDropdownField(
                    label: 'Branch',
                    value: _selectedBranch,
                    items: _branches,
                    onChanged: (value) {
                      setState(() {
                        _selectedBranch = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Department dropdown section
            _buildDropdownField(
              label: 'Department',
              value: _selectedDepartment,
              items: _departments,
              onChanged: (value) {
                setState(() {
                  _selectedDepartment = value;
                });
              },
            ),
            const SizedBox(height: 40),

            // Update Profile Button
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Logic for updating profile can be added here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Profile Updated Successfully!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  // Exact button color from the screenshot
                  backgroundColor: const Color(0xFF836FFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper widget to build a labeled text input field.
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF836FFF),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Helper widget to build a labeled dropdown menu.
  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: value,
          // *** The change is here: added a black icon ***
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black87,
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF836FFF),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
