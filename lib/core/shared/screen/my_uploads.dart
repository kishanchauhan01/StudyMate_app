import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/material_card.dart';
import 'package:study_mate/core/models/upload_item.dart';

class MyUploadsPage extends StatefulWidget {
  const MyUploadsPage({super.key});

  @override
  _MyUploadsPageState createState() => _MyUploadsPageState();
}

class _MyUploadsPageState extends State<MyUploadsPage> {
  // Sample data
  final List<UploadItem> _uploadItems = [
    UploadItem(
      title: 'All about widget',
      sub: 'Flutter',
      type: 'PDF',
      uploadDate: '5th September, 2025',
      
    ),
    UploadItem(
      title: 'C# winform',
      sub: '.NET',
      type: 'PDF',
      uploadDate: '18th December, 2025',
    ),
  ];

  void _deleteItem(int index) {
    setState(() {
      final removedItem = _uploadItems.removeAt(index);
      // Show a snackbar to confirm deletion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${removedItem.title} deleted.'),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  // New function to show the delete confirmation dialog
  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.delete_outline, size: 48),
                const SizedBox(height: 24),
                const Text(
                  'Are you sure you want to delete',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFFFE7474,
                    ), // Red button color from image
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    // Close the dialog first
                    Navigator.of(context).pop();
                    // Then call the original delete function
                    _deleteItem(index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
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
          'My Uploads',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: _uploadItems.length,
        itemBuilder: (context, index) {
          final item = _uploadItems[index];
          return MaterialCard(
            item: item,
            onDelete: () {
              // This now shows the confirmation dialog instead of deleting directly
              _showDeleteConfirmationDialog(index);
            },
            onCardTap: () {
              // This is the action for tapping the card.
              // For now, it just shows a simple message.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Tapped on ${item.title}'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
