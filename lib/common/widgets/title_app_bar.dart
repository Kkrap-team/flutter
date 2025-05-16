import 'package:flutter/material.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/common/styles/text_styles.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleAppBar({super.key, this.actions});

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      title: Row(
        children: [
          Image.asset('assets/images/logo_small.png', width: 32, height: 28),
          Row(
            children: [
              Text('크', style: TextStyles.semiBold14Black),
              Text('크', style: TextStyles.semiBold14Primary),
              Text('랩', style: TextStyles.semiBold14Black),
            ],
          ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
