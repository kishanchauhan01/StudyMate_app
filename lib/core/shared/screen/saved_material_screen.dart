import 'package:flutter/material.dart';
// 1. Import the new common model
import 'package:study_mate/core/models/material_item.dart'; 
// 2. Import the new reusable card widget
import 'package:study_mate/core/common_widgets/material_card.dart'; 

class SavedMaterialsPage extends StatefulWidget {
  const SavedMaterialsPage({super.key});

  @override
  SavedMaterialsPageState createState() => SavedMaterialsPageState();
}

class SavedMaterialsPageState extends State<SavedMaterialsPage> {
  // 3. The list now uses the new 'MaterialItem' model
  final List<MaterialItem> _savedItems = [
    MaterialItem(
      title: 'All about widget',
      subtitle: 'Flutter', // Mapped from 'subject'
      type: 'PDF',
      displayDate: '2h ago', // Mapped from 'timeAgo'
      uploadedBy: 'Ansh',
      uploaderIcon: Icons.person,
      isBookmarked: true, // Set bookmark state
      // --- UI Flags to control the card's appearance ---
      canBookmark: true,
      canDownload: true,
      canOpen: true,
      showUploaderInfo: true,
    ),
    MaterialItem(
      title: 'C# winform',
      subtitle: '.NET',
      type: 'PDF',
      displayDate: '1d ago',
      uploadedBy: 'Jay',
      uploaderIcon: Icons.account_circle,
      isBookmarked: true,
      canBookmark: true,
      canDownload: true,
      canOpen: true,
      showUploaderInfo: true,
    ),
     MaterialItem(
      title: 'State Management Basics',
      subtitle: 'Flutter',
      type: 'DOC',
      displayDate: '3d ago',
      uploadedBy: 'Priya',
      uploaderIcon: Icons.face,
      isBookmarked: true,
      canBookmark: true,
      canDownload: true,
      canOpen: true,
      showUploaderInfo: true,
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
          // 4. Use the single, reusable 'MaterialCard' widget
          return MaterialCard(
            item: item,
            // You can customize its appearance for this screen
            backgroundColor: const Color(0xFFF0F2FF),
            // ignore: deprecated_member_use
            borderColor: Colors.indigo.withOpacity(0.2),
            // Connect all the actions
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