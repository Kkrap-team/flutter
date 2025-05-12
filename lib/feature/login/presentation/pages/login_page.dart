import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/styles/button_styles.dart';
import 'package:krap/common/styles/text_styles.dart';
import 'package:krap/common/widgets/loading_dialog.dart';
import 'package:krap/core/navigation/app_router.dart';
import 'package:krap/feature/login/provider/login_viewmodel_provider.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(loginViewModelProvider.notifier);

    ref.listen<AsyncValue<void>>(loginViewModelProvider, (prev, next) {
      next.whenOrNull(
        loading: () {
          LoadingDialog.show(context);
        },
        data: (_) {
          LoadingDialog.dismiss(context);
          AppRouter.replaceHome(context);
        },
        error: (err, _) {
          LoadingDialog.dismiss(context);
          showDialog(
            context: context,
            builder: (_) => AlertDialog(content: Text('에러: $err')),
          );
        },
      );
    });

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 113, 20, 51),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('일상 속 모든 것을', style: TextStyles.bold30Black),
              Row(
                children: [
                  Text('스', style: TextStyles.bold30Black),
                  Text('크', style: TextStyles.bold30Primary),
                  Text('랩,', style: TextStyles.bold30Black),
                ],
              ),
              Row(
                children: [
                  Text('크', style: TextStyles.bold30Primary),
                  Text('크', style: TextStyles.bold30Black),
                  Text('랩', style: TextStyles.bold30Primary),
                ],
              ),
              Image.asset('assets/images/logo_big.png'),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: viewModel.login,
                  style: ButtonStyles.kakaoButton,
                  child: Image.asset('assets/images/icon_kakao.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
