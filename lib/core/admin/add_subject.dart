import 'package:flutter/material.dart';

class AddSubjectPage extends StatefulWidget {
  const AddSubjectPage({Key? key}) : super(key: key);

  @override
  _AddSubjectPageState createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  final _subjectNameController = TextEditingController();

  @override
  void dispose() {
    _subjectNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text(
          'Add Subject',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // --- Subject Name Field ---
            const Text(
              'Subject Name',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _subjectNameController,
              hintText: 'Flutter',
            ),

            const SizedBox(height: 32),

            // --- Create Subject Button ---
            _buildCreateButton(),
          ],
        ),
      ),
    );
  }

  // Helper widget for text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }

  // Helper widget for the create button
  Widget _buildCreateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Add your logic to create a new subject here
          final subjectName = _subjectNameController.text;
          if (subjectName.isNotEmpty) {
            // Process the new subject name
            print('New Subject Created: $subjectName');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
            0xFF7B61FF,
          ), // Updated solid blue color from image
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          shadowColor: const Color(0xFF7B61FF).withOpacity(0.4),
        ),
        child: const Text(
          'Create new subject',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
