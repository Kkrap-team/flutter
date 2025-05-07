import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:krap/core/navigation/app_router.dart';
import 'package:krap/core/util/app_logger.dart';

class IndexPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SquareTextButton("tutorial", () {
                    AppRouter.goTutorial(context);
                  }),
                ),
                Expanded(
                  child: SquareTextButton("login", () {
                    AppRouter.goLogin(context);
                  }),
                ),
                Expanded(child: SquareTextButton("getKeyHash", () async {
                  String keyHash = await KakaoSdk.origin;
                  AppLogger.d('키 해시: $keyHash');
                })),
                Expanded(child: SquareTextButton("", () {})),
              ],
            ),
            Row(
              children: [
                Expanded(child: SquareTextButton("", () {})),
                Expanded(child: SquareTextButton("", () {})),
                Expanded(child: SquareTextButton("", () {})),
                Expanded(child: SquareTextButton("", () {})),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget SquareTextButton(String data, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          const BorderSide(color: Colors.grey, width: 1), // 테두리 색상과 두께
        ),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
      child: Text(data),
    );
  }
}
