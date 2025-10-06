import 'package:flutter/material.dart';
import '../../../core/models/selected_file.dart'; // Adjust path if needed

// Widget for the file dropzone area
class FileDropzone extends StatelessWidget {
  final VoidCallback onBrowse;
  const FileDropzone({super.key, required this.onBrowse});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF7F8FF),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onBrowse,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.blue.shade300, width: 1.5),
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
                  onPressed: onBrowse,
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
}

// Widget for the selected file card
class SelectedFileCard extends StatelessWidget {
  final SelectedFile file;
  final VoidCallback onRemove;
  const SelectedFileCard({
    super.key,
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    bool isPdf = file.extension.toLowerCase() == 'pdf';
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
                  file.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  file.size,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close_rounded, color: Colors.grey),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}

// Widget for the main upload button
class UploadButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  const UploadButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 81, 62, 226), Color(0xFF6352E4)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 75, 52, 247).withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              )
            : const Text(
                'Upload',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
      ),
    );
  }
}
