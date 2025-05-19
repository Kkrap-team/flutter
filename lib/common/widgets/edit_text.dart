import 'package:flutter/material.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/common/styles/text_styles.dart';

class EditText extends StatelessWidget {
  EditText({
    super.key,
    this.isHighlight = false,
    this.isOutLine = false,
    this.hintText = '',
    required this.controller,
  });

  final bool isHighlight;
  final bool isOutLine;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final border =
        isOutLine
            ? const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey757575, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
            : const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey757575, width: 1),
            );
    final focusedBolder =
        isOutLine
            ? const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey757575, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
            : const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey757575, width: 1),
            );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isHighlight) Text('*', style: TextStyles.regular12red),
            const SizedBox(width: 4),
            Text(hintText, style: TextStyles.regular12grey),
          ],
        ),
        border: border,
        focusedBorder: focusedBolder,
      ),
    );
  }
}
