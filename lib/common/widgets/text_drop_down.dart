import 'package:flutter/material.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/common/styles/text_styles.dart';

class TextDropDown<T> extends StatelessWidget {
  TextDropDown({
    required this.items,
    required this.onChanged,
    this.initIndex = 0,
  });

  final List<T> items;
  final void Function(T? val) onChanged;
  final int initIndex;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: items[initIndex],
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey757575),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey757575),
        ),
      ),
      items:
          items
              .map(
                (value) => DropdownMenuItem(
                  value: value,
                  child: Center(
                    child: Text(
                      value.toString(),
                      style: TextStyles.regular12black,
                    ),
                  ),
                ),
              )
              .toList(),
      onChanged: onChanged,
    );
  }
}
