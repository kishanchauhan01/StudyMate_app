import 'package:flutter/material.dart';

// Model class to hold the data for each saved material item.
class SavedMaterialItem {
  final String title;
  final String subject;
  final String type;
  final String uploadedBy;
  final String timeAgo;
  final IconData uploaderIcon; // To simulate different user avatars

  SavedMaterialItem({
    required this.title,
    required this.subject,
    required this.type,
    required this.uploadedBy,
    required this.timeAgo,
    required this.uploaderIcon,
  });
}

// This is the main component for the saved material card.
class SavedMaterialCard extends StatelessWidget {
  final SavedMaterialItem item;
  final VoidCallback onCardTap;
  final VoidCallback onBookmarkTap;
  final VoidCallback onDownloadTap;
  final VoidCallback onOpenTap;

  const SavedMaterialCard({
    Key? key,
    required this.item,
    required this.onCardTap,
    required this.onBookmarkTap,
    required this.onDownloadTap,
    required this.onOpenTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        color: const Color(0xFFF0F2FF), // Applied the same background color
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          splashColor: Colors.black.withOpacity(0.08),
          highlightColor: Colors.transparent,
          onTap: onCardTap,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF9FB5FF).withOpacity(0.5), // Applied the same shadow
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              border: Border.all(
                color: Colors.indigo.withOpacity(0.2), // Applied the same border
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: Time ago and Bookmark icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.timeAgo,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                        fontFamily: 'monospace',
                      ),
                    ),
                    InkWell(
                      onTap: onBookmarkTap,
                      child: const Icon(Icons.bookmark, color: Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Title
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 8),
                // Subject and Type
                Row(
                  children: [
                    Text(
                      item.subject,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.blue.shade300, width: 1),
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
                const SizedBox(height: 16),
                // Bottom row: Uploader and Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Uploader info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(item.uploaderIcon, size: 14, color: Colors.black54),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Uploaded by ${item.uploadedBy}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    // Actions
                    Row(
                      children: [
                        _buildActionButton('Download', onDownloadTap),
                        const SizedBox(width: 16),
                        _buildActionButton('Open', onOpenTap),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper for Download/Open buttons
  Widget _buildActionButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}

// This is a sample screen to display the component.
class SavedMaterialsPage extends StatefulWidget {
  const SavedMaterialsPage({Key? key}) : super(key: key);

  @override
  _SavedMaterialsPageState createState() => _SavedMaterialsPageState();
}

class _SavedMaterialsPageState extends State<SavedMaterialsPage> {
  // Sample data
  final List<SavedMaterialItem> _savedItems = [
    SavedMaterialItem(
      title: 'All about widget',
      subject: 'Flutter',
      type: 'PDF',
      uploadedBy: 'Ansh',
      timeAgo: '2h ago',
      uploaderIcon: Icons.person,
    ),
    SavedMaterialItem(
      title: 'C# winform',
      subject: '.NET',
      type: 'PDF',
      uploadedBy: 'Jay',
      timeAgo: '1d ago',
      uploaderIcon: Icons.account_circle,
    ),
    SavedMaterialItem(
      title: 'All about widget',
      subject: 'Flutter',
      type: 'PDF',
      uploadedBy: 'Ansh',
      timeAgo: '2h ago',
      uploaderIcon: Icons.person,
    ),
    SavedMaterialItem(
      title: 'C# winform',
      subject: '.NET',
      type: 'PDF',
      uploadedBy: 'Jay',
      timeAgo: '1d ago',
      uploaderIcon: Icons.account_circle,
    ),
  ];

  void _showSnackbar(String message) {
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 1),
        ),
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
          'Saved Materials',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: _savedItems.length,
        itemBuilder: (context, index) {
          final item = _savedItems[index];
          return SavedMaterialCard(
            item: item,
            onCardTap: () => _showSnackbar('Tapped on ${item.title}'),
            onBookmarkTap: () => _showSnackbar('Toggled bookmark for ${item.title}'),
            onDownloadTap: () => _showSnackbar('Downloading ${item.title}...'),
            onOpenTap: () => _showSnackbar('Opening ${item.title}...'),
          );
        },
      ),
    );
  }
}

