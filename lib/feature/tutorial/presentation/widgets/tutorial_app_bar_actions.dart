import 'package:flutter/material.dart';
import 'package:krap/common/styles/text_styles.dart';

class TutorialAppBarActions extends StatelessWidget {
  TutorialAppBarActions({required this.onBackPress});

  final VoidCallback onBackPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: onBackPress,
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          minimumSize: WidgetStateProperty.all(Size.zero),
        ),
        child: Text("건너뛰기", style: TextStyles.medium14Grey),
      ),
    );
  }
}
