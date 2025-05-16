import 'package:flutter/material.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/common/styles/text_styles.dart';

class TutorialIndicator extends StatelessWidget {
  const TutorialIndicator({
    super.key,
    required this.currentIndex,
    required this.onNext,
    required this.onPrev,
    required this.goLogin,
  });

  static const int totalCount = 4;
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final VoidCallback goLogin;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onPrev,
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              minimumSize: WidgetStateProperty.all(Size.zero),
            ),
            child: Text(
              '이전으로',
              style:
                  currentIndex == 0
                      ? TextStyles.semiBold16Trans
                      : TextStyles.semiBold16Grey,
            ),
          ),
          Row(
            children: List.generate(totalCount, (index) {
              final isActive = index == currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primary : AppColors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ),

          TextButton(
            onPressed: currentIndex == totalCount - 1 ? goLogin : onNext,
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              minimumSize: WidgetStateProperty.all(Size.zero),
            ),
            child: Text('다음으로', style: TextStyles.semiBold16Black),
          ),
        ],
      ),
    );
  }
}
