import 'package:flutter/material.dart';

class MaterialItem {
  // --- Core Data Fields ---
  final String title;
  final String subtitle;
  final String type;
  final String displayDate; // A generic field for 'uploadDate' or 'timeAgo'

  // --- Optional Fields (for Saved Materials) ---
  final String? uploadedBy;
  final IconData? uploaderIcon;

  // --- UI Control Flags ---
  final bool canDelete;
  final bool canBookmark;
  final bool isBookmarked;
  final bool canDownload;
  final bool canOpen;
  final bool showUploaderInfo;

  MaterialItem({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.displayDate,
    this.uploadedBy,
    this.uploaderIcon,
    this.canDelete = false, // Default to false
    this.canBookmark = false, // Default to false
    this.isBookmarked = false, // Default to false
    this.canDownload = false, // Default to false
    this.canOpen = false, // Default to false
    this.showUploaderInfo = false, // Default to false
  });
}