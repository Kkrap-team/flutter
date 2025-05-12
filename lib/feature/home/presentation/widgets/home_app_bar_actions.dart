import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/provider/user_provider.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/core/util/app_logger.dart';

class HomeAppBarActions extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImage = ref.watch(userProvider).maybeWhen(
      data: (user) => user?.profile ?? '',
      orElse: () => '',
    );

    AppLogger.d("HomeAppBarActions profileImage = $profileImage");

    return Row(
      spacing: 8,
      children: [
        Image.asset('assets/images/icon_search.png', width: 20, height: 20),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset('assets/images/icon_alarm.png', width: 18, height: 20),
            Positioned(
              top: 0,
              right: -1,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 12,
          backgroundImage: NetworkImage(
            profileImage,
          ),
        ),
        const SizedBox(width: 12),
        // Image.asset('assets/images/icon_search.png'),
      ],
    );
  }
}
