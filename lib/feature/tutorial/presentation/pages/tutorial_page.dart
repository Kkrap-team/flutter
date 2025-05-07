import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/styles/text_styles.dart';
import 'package:krap/core/navigation/app_router.dart';
import 'package:krap/feature/tutorial/presentation/widgets/tutorial_indicator.dart';
import 'package:krap/feature/tutorial/presentation/widgets/tutorial_link.dart';
import 'package:krap/feature/tutorial/provider/tutorial_viewmodel_provider.dart';

class TutorialPage extends ConsumerWidget {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(tutorialViewModelProvider);
    final viewModel = ref.read(tutorialViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () async {
                await viewModel.completeTutorial();
                if (context.mounted) {
                  AppRouter.goLogin(context);
                }
              },
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                minimumSize: WidgetStateProperty.all(Size.zero),
              ),
              child: Text("건너뛰기", style: TextStyles.medium14Grey),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: viewModel.setPage,
            children: List.generate(4, (index) {
              return TutorialLink();
            }),
          ),
          TutorialIndicator(
            currentIndex: pageIndex,
            onNext:
                () => controller.animateToPage(
                  pageIndex + 1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
            onPrev:
                () => controller.animateToPage(
                  pageIndex - 1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
            goLogin: () async {
              await viewModel.completeTutorial();
              if (context.mounted) {
                AppRouter.goLogin(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
