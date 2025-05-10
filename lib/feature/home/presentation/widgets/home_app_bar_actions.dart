import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/styles/app_colors.dart';

class HomeAppBarActions extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        const CircleAvatar(
          radius: 12,
          backgroundImage: NetworkImage(
            'http://img1.kakaocdn.net/thumb/R640x640.q70/?fname=http://t1.kakaocdn.net/account_images/default_profile.jpeg',
          ),
        ),
        const SizedBox(width: 12), // 좌우로 8만큼 공간
        // Image.asset('assets/images/icon_search.png'),
      ],
    );
  }
}
