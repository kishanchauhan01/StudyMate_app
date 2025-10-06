import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/material_card.dart';
import 'package:study_mate/core/models/material_item.dart'; // Use the new model

class MyUploadsScreen extends StatefulWidget {
  const MyUploadsScreen({super.key});

  @override
  _MyUploadsScreenState createState() => _MyUploadsScreenState();
}

class _MyUploadsScreenState extends State<MyUploadsScreen> {
  // Use the new MaterialItem model
  final List<MaterialItem> _uploadItems = [
    MaterialItem(
      title: 'All about widget',
      subtitle: 'Flutter', // Changed to subtitle
      type: 'PDF',
      displayDate: '5th September, 2025', // Changed to displayDate
      canDelete: true, // Set the flag to show delete icon
    ),
    MaterialItem(
      title: 'C# winform',
      subtitle: '.NET',
      type: 'PDF',
      displayDate: '18th December, 2025',
      canDelete: true,
    ),
  ];

  // Rest of the code (delete logic) remains the same
  void _deleteItem(int index) {
    setState(() {
      final removedItem = _uploadItems.removeAt(index);
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
          // Use the new, versatile MaterialCard
          return MaterialCard(
            item: item,
            // The card is white by default, so no need to set color
            backgroundColor: const Color(0xFFF0F2FF),
            borderColor: Colors.indigo.withOpacity(0.2),
            onDeleteTap: () {
              _showDeleteConfirmationDialog(index);
            },
            onCardTap: () {
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
