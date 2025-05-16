import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/widgets/title_app_bar.dart';
import 'package:krap/core/navigation/app_router.dart';
import 'package:krap/feature/tutorial/presentation/widgets/tutorial_app_bar_actions.dart';
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
      appBar: TitleAppBar(
        actions: [
          TutorialAppBarActions(
            onBackPress: () async {
              await viewModel.completeTutorial();
              if (context.mounted) {
                AppRouter.goLogin(context);
              }
            },
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
