import 'dart:math';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../models/selected_file.dart'; // Adjust path if needed

class UploadManager extends ChangeNotifier {
  // --- State Variables ---
  SelectedFile? _selectedFile;
  final TextEditingController titleController = TextEditingController();
  String? _selectedSubject;
  String? _selectedType;
  bool _isLoading = false;

  // --- Data for Dropdowns ---
  final List<String> subjects = ['Flutter', '.NET', 'Java', 'Python'];
  final List<String> types = ['Notes', 'FAQ', 'Previous year question paper'];

  // --- Getters to expose state to the UI safely ---
  SelectedFile? get selectedFile => _selectedFile;
  String get selectedSubject => _selectedSubject ?? subjects.first;
  String get selectedType => _selectedType ?? types.first;
  bool get isLoading => _isLoading;

  UploadManager() {
    _selectedSubject = subjects.first;
    _selectedType = types.first;
  }

  // --- Logic Methods ---
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      _selectedFile = SelectedFile(
        name: file.name,
        size: _formatBytes(file.size, 2),
        extension: file.extension ?? 'file',
      );
      titleController.text = file.name.split('.').first;
      notifyListeners();
    }
  }

  void removeFile() {
    _selectedFile = null;
    titleController.clear();
    notifyListeners();
  }

  void updateSubject(String? newSubject) {
    if (newSubject != null) {
      _selectedSubject = newSubject;
      notifyListeners();
    }
  }

  void updateType(String? newType) {
    if (newType != null) {
      _selectedType = newType;
      notifyListeners();
    }
  }

  Future<void> uploadMaterial() async {
    if (_selectedFile == null) {
      print("Error: No file selected.");
      return;
    }
    if (titleController.text.isEmpty) {
      print("Error: Title cannot be empty.");
      return;
    }

    _isLoading = true;
    notifyListeners();

    print('---- UPLOADING MATERIAL ----');
    print('Title: ${titleController.text}');
    print('Subject: $_selectedSubject');
    print('Type: $_selectedType');
    print('File: ${_selectedFile!.name}');

    // Simulate a network upload that takes 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
    print('---- UPLOAD COMPLETE ----');
  }

  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
}
