import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// --- (1) Import your manager to access state and logic ---
import '../../managers/upload_manager.dart';

// --- (2) Import your reusable form fields ---
import '../../common_widgets/custom_form_fields.dart';

// --- (3) Import your screen-specific UI widgets ---
import '../../common_widgets/upload_widgets.dart';

class UploadMaterialScreen extends StatelessWidget {
  const UploadMaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 'watch' rebuilds the UI when data changes (e.g., when a file is selected)
    final manager = context.watch<UploadManager>();

    // 'read' is used for calling functions without rebuilding the UI
    final managerReader = context.read<UploadManager>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          // In a real app, you would use Navigator.pop(context)
          onPressed: () {},
        ),
        title: const Text(
          'Upload your material',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        // Use consistent padding
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- UI changes based on whether a file is selected ---
            if (manager.selectedFile == null)
              FileDropzone(onBrowse: managerReader.pickFile)
            else
              SelectedFileCard(
                file: manager.selectedFile!,
                onRemove: managerReader.removeFile,
              ),

            const SizedBox(height: 24),

            // --- Reusable Form Fields ---
            CustomFormField(
              label: 'Title',
              controller: manager.titleController,
            ),
            const SizedBox(height: 16),

            CustomDropdownFormField(
              label: 'Subject',
              value: manager.selectedSubject,
              items: manager.subjects,
              onChanged: managerReader.updateSubject,
            ),
            const SizedBox(height: 16),

            CustomDropdownFormField(
              label: 'Type',
              value: manager.selectedType,
              items: manager.types,
              onChanged: managerReader.updateType,
            ),

            const SizedBox(height: 40),

            // --- Reusable Button ---
            UploadButton(
              isLoading: manager.isLoading,
              onPressed: managerReader.uploadMaterial,
            ),
          ],
        ),
      ),
    );
  }
}
