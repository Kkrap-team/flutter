import 'package:flutter/material.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/common/styles/text_styles.dart';

class TextDropDown<T> extends StatelessWidget {
  TextDropDown({
    required this.items,
    required this.onChanged,
    this.isOutLine = false,
    this.initIndex = 0,
  });

  final List<T> items;
  final void Function(int changedIndex) onChanged;
  final bool isOutLine;
  final int initIndex;

  @override
  Widget build(BuildContext context) {
    var border =
        isOutLine
            ? const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey757575, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
            : const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey757575, width: 1),
            );
    var focusedBolder =
        isOutLine
            ? const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey757575, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
            : const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey757575, width: 1),
            );

    return DropdownButtonFormField<T>(
      isDense: true,
      isExpanded: true,
      value: items[initIndex],
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: border,
        focusedBorder: focusedBolder,
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
      onChanged: (val) {
        final int idx = items.indexOf(val as T);
        onChanged(idx);
      },
    );
  }
}
