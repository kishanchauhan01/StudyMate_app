import 'package:flutter/material.dart';
import 'package:study_mate/core/theme/app_colors.dart';

class CustomeTextField extends StatefulWidget {
  final String lable;
  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;
  final TextInputType keyboardType;

  const CustomeTextField({
    super.key,
    required this.lable,
    required this.hintText,
    required this.controller,
    required this.obsecureText,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  late bool _isObsecure;

  @override
  void initState() {
    super.initState();
    _isObsecure = widget.obsecureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            widget.lable,
            style: TextStyle(
              color: AppColors.txtGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        TextField(
          controller: widget.controller,
          obscureText: _isObsecure,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.txtBlack, fontWeight: FontWeight.w500),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 20.0,
            ),

            // Style for the border when the field is not focused
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),

            // Style for the border when the field is focused
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Colors.blue, // Or your primary color
                width: 2.0,
              ),
            ),

            suffixIcon: widget.obsecureText
                ? IconButton(
                    onPressed: () {
                      _isObsecure = !_isObsecure;
                      setState(() {});
                    },
                    icon: Icon(
                      _isObsecure ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
