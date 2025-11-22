import 'package:flutter/material.dart';
import 'package:study_mate/core/common_widgets/recent_item_card.dart';
import 'package:study_mate/core/common_widgets/subject_grid_item.dart';
import 'package:study_mate/core/shared/screen/upload_material_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All', 'Notes', 'Projects', 'Roadmaps'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            _buildGreeting(),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildFilterChips(),
            const SizedBox(height: 30),
            _buildSectionHeader("Recently Added", () {}),
            const SizedBox(height: 15),
            _buildRecentlyAddedList(),
            const SizedBox(height: 30),
            _buildSectionHeader("Your Subjects", () {}),
            const SizedBox(height: 15),
            _buildSubjectsGrid(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UploadMaterialScreen()),
          );
        },
        backgroundColor: const Color(0xFF6A6AE3),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // --- All the helper methods remain the same ---

  Widget _buildGreeting() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good morning,',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        Text(
          'Ansh Dholakiya 👋',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for notes, projects...',
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

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
              side: BorderSide(color: Colors.grey.shade300),
            ),
            showCheckmark: false,
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onViewAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewAll,
          child: const Row(
            children: [
              Text('See all'),
              Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentlyAddedList() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          RecentItemCard(
            title: 'All about widget life cycle in flutter',
            technology: 'Flutter',
            subtitle: 'PDF',
            cardColor: Colors.blue,
            techIcon: Icons.flutter_dash,
          ),
          RecentItemCard(
            title: 'C# winform project using .NET',
            technology: '.NET Core',
            subtitle: 'PDF',
            cardColor: Color(0xFFB0A4E3),
            techIcon: Icons.code,
          ),
          RecentItemCard(
            title: 'Firebase Auth integration with flutter',
            technology: 'Flutter',
            subtitle: 'PDF',
            cardColor: Colors.lightBlue,
            techIcon: Icons.flutter_dash,
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectsGrid() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: const [
        SubjectGridItem(
          subjectName: 'Flutter',
          icon: Icon(Icons.flutter_dash, color: Colors.blue),
        ),
        SubjectGridItem(
          subjectName: '.NET',
          icon: Text(
            '.NET',
            style: TextStyle(
              color: Color(0xFFB0A4E3),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SubjectGridItem(
          subjectName: 'SQL',
          icon: Icon(Icons.storage, color: Colors.orange),
        ),
        SubjectGridItem(
          subjectName: 'JavaScript',
          icon: Text(
            'JS',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        SubjectGridItem(
          subjectName: 'Flutter',
          icon: Icon(Icons.flutter_dash, color: Colors.blue),
        ),
        SubjectGridItem(
          subjectName: '.NET',
          icon: Text(
            '.NET',
            style: TextStyle(
              color: Color(0xFFB0A4E3),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SubjectGridItem(
          subjectName: 'SQL',
          icon: Icon(Icons.storage, color: Colors.orange),
        ),
        SubjectGridItem(
          subjectName: 'JavaScript',
          icon: Text(
            'JS',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
