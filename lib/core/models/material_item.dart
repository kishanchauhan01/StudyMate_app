import 'package:flutter/material.dart';

class MaterialItem { 
  final String title;
  final String subtitle;
  final String type;
  final String displayDate;  
 
  final String? uploadedBy;
  final IconData? uploaderIcon;
 
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
    this.canDelete = false, 
    this.canBookmark = false, // Default
    this.isBookmarked = false, // Default 
    this.canDownload = false, // Defaul
    this.canOpen = false, // Default 
    this.showUploaderInfo = false, // Default
  });
}