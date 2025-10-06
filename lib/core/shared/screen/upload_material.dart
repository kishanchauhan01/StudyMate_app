import 'package:flutter/material.dart'; 
import 'package:file_picker/file_picker.dart';
import 'dart:math';

// A simple model to hold file information
class SelectedFile {
  final String name;
  final String size;
  final String extension;

  SelectedFile({
    required this.name,
    required this.size,
    required this.extension,
  });
}

class UploadMaterialPage extends StatefulWidget {
  const UploadMaterialPage({super.key});

  @override
  _UploadMaterialPageState createState() => _UploadMaterialPageState();
}

class _UploadMaterialPageState extends State<UploadMaterialPage> {
  // State variables to manage the UI
  SelectedFile? _selectedFile;
  final _titleController = TextEditingController();
  String? _selectedSubject;
  String? _selectedType;

  // Dropdown menu items
  final List<String> _subjects = ['Flutter', '.NET', 'Java', 'Python'];
  final List<String> _types = ['Notes', 'FAQ', 'Previous year question paper'];

  @override
  void initState() {
    super.initState();
    // Set initial values for the dropdowns
    _selectedSubject = _subjects.first;
    _selectedType = _types.first;
  }

  // Helper function to format file size in bytes to a readable format
  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  // This function now uses the file_picker package to select a real file.
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _selectedFile = SelectedFile(
          name: file.name,
          size: _formatBytes(file.size, 2),
          extension: file.extension ?? '',
        );
        // Pre-fill the title with the file name without the extension
        _titleController.text = file.name.split('.').first;
      });
    } else {
      // User canceled the picker
    }
  }

  // This function simulates removing the selected file.
  void _removeFile() {
    setState(() {
      _selectedFile = null;
      _titleController.clear();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
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
          'Upload your material',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- File Dropzone ---
            if (_selectedFile == null) _buildFileDropzone(),

            // --- Selected File Card ---
            if (_selectedFile != null) _buildSelectedFileCard(),

            const SizedBox(height: 24),

            // --- Form Fields ---
            const Text(
              'Title',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _titleController,
              hintText: 'Enter File Title',
            ),

            const SizedBox(height: 16),
            const Text(
              'Subject',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            _buildDropdown(
              items: _subjects,
              value: _selectedSubject,
              onChanged: (value) {
                setState(() {
                  _selectedSubject = value;
                });
              },
            ),

            const SizedBox(height: 16),
            const Text(
              'Type',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            _buildDropdown(
              items: _types,
              value: _selectedType,
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
            ),

            const SizedBox(height: 40),

            // --- Upload Button ---
            _buildUploadButton(),
          ],
        ),
      ),
    );
  }

  // Helper widget for the file dropzone area
  Widget _buildFileDropzone() {
    return Material(
      color: const Color(0xFFF7F8FF),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: _pickFile,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.blue.shade300,
              width: 1.5,
            ), // Dashed effect placeholder
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.cloud_upload_rounded,
                  color: Colors.blue.shade700,
                  size: 48,
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: _pickFile,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue.shade700),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Browse files'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for the selected file card
  Widget _buildSelectedFileCard() {
    bool isPdf = _selectedFile!.extension.toLowerCase() == 'pdf';
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          isPdf
              ? const Icon(Icons.picture_as_pdf, color: Colors.red, size: 32)
              : const Icon(Icons.image, color: Colors.green, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _selectedFile!.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  _selectedFile!.size,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close_rounded, color: Colors.grey),
            onPressed: _removeFile,
          ),
        ],
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

  // Helper widget for dropdowns
  Widget _buildDropdown({
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
      items: items.map((String item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
    );
  }

  // Helper widget for the upload button
  Widget _buildUploadButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF8A7BFF), Color(0xFF6352E4)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 99, 79, 251).withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          // Add your review and upload logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Upload',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
