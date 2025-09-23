import 'package:flutter/material.dart';
import 'package:study_mate/core/theme/app_colors.dart'; // Make sure this path is correct

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final double? width; // <-- 1. ADD THE WIDTH PROPERTY

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isPrimary,
    this.width, // <-- 2. ADD IT TO THE CONSTRUCTOR
  });

  @override
  Widget build(BuildContext context) {
    // Create the button widget first
    final Widget button = isPrimary
        // Primary btn
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              // REMOVE maximumSize: Size(5, 5), it will make the button too small
              foregroundColor: Colors.white,
              backgroundColor:
                  AppColors.btnIsPrimary, // Using your custom color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            onPressed: onPressed,
            child: Text(text),
          )
        // Secondary btn
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  AppColors.btnIsPrimary, // Using your custom color
              side: BorderSide(color: AppColors.btnIsPrimary, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            onPressed: onPressed,
            child: Text(text),
          );

    // 3. CONDITIONALLY WRAP THE BUTTON WITH SIZEDBOX
    return width != null ? SizedBox(width: width, child: button) : button;
  }
}
