import 'package:flutter/material.dart';
import 'package:study_mate/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    // Primary btn
    if (isPrimary) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.btnIsPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
        onPressed: onPressed,
        child: Text(text),
      );
    }
    // Secondary btn
    else {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.btnIsPrimary,
          side: BorderSide(color: AppColors.btnIsPrimary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
        onPressed: onPressed,
        child: Text(text),
      );
    }
  }
}
