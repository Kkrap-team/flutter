import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/widgets/title_app_bar.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/core/util/extension.dart';
import 'package:krap/feature/main/presentation/widgets/main_app_bar_actions.dart';
import 'package:krap/feature/main/presentation/widgets/main_bottom_nav.dart';
import 'package:krap/feature/main/provider/main_viewmodel_provider.dart';
import 'package:krap/feature/main/tabs/folder/presentation/widgets/folder_tab.dart';
import 'package:krap/feature/tutorial/presentation/widgets/tutorial_link.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<MainPage> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    final index = ref.read(mainViewModelProvider);
    controller = PageController(initialPage: index);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = ref.watch(mainViewModelProvider);
    final viewModel = ref.read(mainViewModelProvider.notifier);

    return SafeArea(
      child: Scaffold(
        appBar: TitleAppBar(actions: [MainAppBarActions()]),
        body: Stack(
          children: [
            PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(4, (index) {
                switch (index) {
                  case 0:
                    return TutorialLink();
                  case 1:
                    return ForderTab();
                  case 2:
                    return TutorialLink();
                  default:
                    return TutorialLink();
                }
              }),
            ),
          ],
        ),
        bottomNavigationBar: MainBottomNav(
          controller: controller,
          currentIndex: pageIndex,
          onTap: (index) {
            AppLogger.d('++MainPage jumpToPage() index =  $index');
            controller.animateToPage(
              index,
              duration: 300.ms,
              curve: Curves.easeInOut,
            );
            viewModel.setPage(index);
          },
        ),
      ),
    );
  }
}
