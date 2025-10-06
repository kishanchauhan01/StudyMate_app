import 'package:flutter/material.dart';
import 'package:study_mate/core/models/material_item.dart';

class MaterialCard extends StatelessWidget {
  final MaterialItem item;
  final Color backgroundColor;
  final Color borderColor;

  // --- Optional Callbacks for Actions ---
  final VoidCallback? onCardTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onBookmarkTap;
  final VoidCallback? onDownloadTap;
  final VoidCallback? onOpenTap;

  const MaterialCard({
    super.key,
    required this.item,
    this.backgroundColor = Colors.white, // Default to white
    this.borderColor = const Color.fromARGB(126, 0, 0, 0),
    this.onCardTap,
    this.onDeleteTap,
    this.onBookmarkTap,
    this.onDownloadTap,
    this.onOpenTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: onCardTap,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: borderColor, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Top Row: Date, Delete, and Bookmark Icons ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.displayDate,
                      style: const TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                    Row(
                      children: [
                        // Show Bookmark Icon if enabled
                        if (item.canBookmark)
                          InkWell(
                            onTap: onBookmarkTap,
                            child: Icon(
                              item.isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: Colors.black87,
                            ),
                          ),
                        // Show Delete Icon if enabled
                        if (item.canDelete) ...[
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: onDeleteTap,
                            child: const Icon(Icons.delete, color: Colors.black87),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // --- Title ---
                Text(
                  item.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // --- Subtitle and Type ---
                Row(
                  children: [
                    Text(
                      item.subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
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
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // --- Bottom Row: Uploader Info and Actions ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Show Uploader Info if enabled
                    if (item.showUploaderInfo)
                      _buildUploaderInfo(),
                    
                    // Spacer to push actions to the right if uploader info is hidden
                    if (!item.showUploaderInfo)
                      const Spacer(),

                    // Show Download/Open Actions if enabled
                    Row(
                      children: [
                        if (item.canDownload)
                          _buildActionButton('Download', onDownloadTap),
                        if (item.canDownload && item.canOpen)
                          const SizedBox(width: 16),
                        if (item.canOpen)
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

  Widget _buildUploaderInfo() {
    return Row(
      children: [
        if (item.uploaderIcon != null) ...[
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey.shade200,
            child: Icon(item.uploaderIcon, size: 14, color: Colors.black54),
          ),
          const SizedBox(width: 8),
        ],
        Text(
          'Uploaded by ${item.uploadedBy ?? 'Unknown'}',
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}