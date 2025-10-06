import 'package:flutter/material.dart';

class RecentItemCard extends StatelessWidget {
  final String title;
  final String technology;
  final String subtitle;
  final Color cardColor;
  final IconData techIcon;

  const RecentItemCard({
    super.key,
    required this.title,
    required this.technology,
    required this.subtitle,
    required this.cardColor,
    required this.techIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top colored part
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(techIcon, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                Text(
                  technology,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Bottom white part
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.person_pin, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      'Ansh',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                    const Spacer(),
                    Text(
                      '2h ago',
                      style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}