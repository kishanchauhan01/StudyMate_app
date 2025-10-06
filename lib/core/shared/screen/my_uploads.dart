import 'package:flutter/material.dart';

// Model class to hold the data for each upload item.
class UploadItem {
  final String title;
  final String sub;
  final String type;
  final String uploadDate;

  UploadItem({
    required this.title,
    required this.sub,
    required this.type,
    required this.uploadDate,
  });
}

// This is the main component you requested.
// It's a stateless widget that displays the details of an uploaded file.
class UploadItemCard extends StatelessWidget {
  final UploadItem item;
  final VoidCallback onDelete;
  final VoidCallback onCardTap;

  const UploadItemCard({
    Key? key,
    required this.item,
    required this.onDelete,
    required this.onCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // To match the font from the screenshot, you can use the google_fonts package.
    // For example, add `google_fonts: ^6.1.0` to your pubspec.yaml
    // and then use `style: GoogleFonts.spaceMono(...)` for the TextStyles.
    // For this example, we will use the default font.

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        color: const Color(0xFFF0F2FF),
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: onCardTap,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.transparent, // Color is now on the Material widget
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF9FB5FF).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              border: Border.all(
                color: Colors.indigo.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title text expands to take available space
                    Expanded(
                      child: Text(
                        'Title: ${item.title}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    // Share button, hidden as per your request
                    const Visibility(
                      visible: false,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Icon(Icons.open_in_new, color: Colors.black87),
                    ),
                    const SizedBox(width: 8),
                    // Clickable Delete Button
                    InkWell(
                      onTap: onDelete,
                      borderRadius: BorderRadius.circular(24),
                      child: const Icon(Icons.delete, color: Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Sub: ${item.sub}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Type: ',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontFamily: 'monospace',
                      ),
                    ),
                    // PDF Tag
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.blue.shade300,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        item.type,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Uploaded on: ${item.uploadDate}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// This is a sample screen to display the component.
// You can copy the `UploadItemCard` widget into your own project.
class MyUploadsPage extends StatefulWidget {
  const MyUploadsPage({Key? key}) : super(key: key);

  @override
  _MyUploadsPageState createState() => _MyUploadsPageState();
}

class _MyUploadsPageState extends State<MyUploadsPage> {
  // Sample data
  List<UploadItem> _uploadItems = [
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
          return UploadItemCard(
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

// To run this code, you can use a main function like this:
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyUploadsPage(),
    );
  }
}
*/
