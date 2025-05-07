import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/styles/text_styles.dart';

class HomeBottomNav extends ConsumerWidget {
  HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.controller,
  });

  final PageController controller;
  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = [
      _TabItem('홈', 'tab_home.png', 'tab_active_home.png'),
      _TabItem('보관함', 'tab_folder.png', 'tab_active_folder.png'),
      _TabItem('팔로우', 'tab_follow.png', 'tab_active_follow.png'),
      _TabItem('설정', 'tab_setting.png', 'tab_active_setting.png'),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          final tab = tabs[index];
          final isSelected = index == currentIndex;

          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            behavior: HitTestBehavior.translucent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/${isSelected ? tab.activeIcon : tab.inactiveIcon}',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  tab.label,
                  style:
                      isSelected
                          ? TextStyles.regular10primary
                          : TextStyles.regular10grey,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _TabItem {
  _TabItem(this.label, this.inactiveIcon, this.activeIcon);

  final String label;
  final String inactiveIcon;
  final String activeIcon;
}
