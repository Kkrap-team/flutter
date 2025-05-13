import 'package:flutter/material.dart';
import 'package:krap/common/styles/app_colors.dart';

class ButtonStyles {
  static final ButtonStyle kakaoButton = ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    minimumSize: Size.zero,
    alignment: Alignment.center,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    backgroundColor: Colors.transparent,
    // 이미지 배경 투명 처리
    shadowColor: Colors.transparent, // 그림자 제거(필요하면)
  );

  static final cancelButton = OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
    minimumSize: const Size(60, 30),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  static final confirmButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 13),
    minimumSize: const Size(60, 30),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(26),
    ),
  );
}
