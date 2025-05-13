import 'package:flutter/material.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/common/styles/text_styles.dart';

class EditText extends StatelessWidget {
  EditText({
    super.key,
    this.isHighlight = false,
    this.hintText = '',
    required this.controller,
  });

  final bool isHighlight;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isHighlight) Text('*', style: TextStyles.regular12red),
            SizedBox(width: 4),
            Text(hintText, style: TextStyles.regular12grey),
          ],
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey757575),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
      ),
    );
  }
}
