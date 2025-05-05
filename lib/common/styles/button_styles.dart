import 'package:flutter/material.dart';

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
}
