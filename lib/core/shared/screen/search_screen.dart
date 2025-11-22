import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/material_card.dart';
import 'package:study_mate/core/models/material_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // State to keep track of which filter is selected
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['Student', 'Faculty', 'Project\'s', 'PYQs'];

  final List<MaterialItem> _savedItems = [
    MaterialItem(
      title: 'All about widget',
      subtitle: 'Flutter',
      type: 'PDF',
      displayDate: '2h ago',
      uploadedBy: 'Ansh',
      uploaderIcon: Icons.person,
      isBookmarked: true,
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
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildSearchBar(),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildFilterChips(),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: _savedItems.length,
                itemBuilder: (context, index) {
                  final item = _savedItems[index];

                  return MaterialCard(
                    item: item,

                    backgroundColor: const Color(0xFFF0F2FF),

                    borderColor: const Color.fromARGB(166, 0, 0, 0),

                    onCardTap: () => _showSnackbar('Tapped on ${item.title}'),
                    onBookmarkTap: () =>
                        _showSnackbar('Toggled bookmark for ${item.title}'),
                    onDownloadTap: () =>
                        _showSnackbar('Downloading ${item.title}...'),
                    onOpenTap: () => _showSnackbar('Opening ${item.title}...'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to build the Search Bar
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Find materials...',
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: const Icon(
          Icons.tune,
          color: Colors.grey,
        ), // Tune/Filter icon
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// Helper method to build the Filter Chips
  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final bool isSelected = _selectedFilterIndex == index;
          return ChoiceChip(
            label: Text(_filters[index]),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                _selectedFilterIndex = selected ? index : -1;
              });
            },
            backgroundColor: Colors.white,
            selectedColor: const Color(0xFF6A6AE3),
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: isSelected
                  ? BorderSide.none
                  : BorderSide(color: Colors.grey.shade300),
            ),
            showCheckmark: false,
          );
        },
      ),
    );
  }
}
