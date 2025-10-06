import 'package:flutter/material.dart';
import 'package:study_mate/core/models/upload_item.dart';

class MaterialCard extends StatelessWidget {
  final UploadItem item;
  final VoidCallback onDelete;
  final VoidCallback onCardTap;

  const MaterialCard({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    // To match the font from the screenshot, you can use the google_fonts package.
    // For example, add `google_fonts: ^6.1.0` to your pubspec.yaml
    // and then use `style: GoogleFonts.spaceMono(...)` for the TextStyles.
    // For this example, we will use the default font.

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: onCardTap,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.transparent, // Color is now on the Material widget
              borderRadius: BorderRadius.circular(20.0),
              // boxShadow: [
              //   BoxShadow(
              //     color: const Color.fromARGB(255, 249, 249, 249),
              //     spreadRadius: 0,
              //     blurRadius: 20,
              //     offset: const Offset(0, 10),
              //   ),
              // ],
              border: Border.all(
                color: const Color.fromARGB(126, 0, 0, 0),
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

