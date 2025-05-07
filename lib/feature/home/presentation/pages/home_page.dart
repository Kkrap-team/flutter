import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/widgets/title_app_bar.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/core/util/extension.dart';
import 'package:krap/feature/home/presentation/widgets/home_app_bar_actions.dart';
import 'package:krap/feature/home/presentation/widgets/home_bottom_nav.dart';
import 'package:krap/feature/home/provider/home_viewmodel_provider.dart';
import 'package:krap/feature/tutorial/presentation/widgets/tutorial_link.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    final index = ref.read(homeViewModelProvider);
    controller = PageController(initialPage: index);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);

    return SafeArea(
      child: Scaffold(
        appBar: TitleAppBar(actions: [HomeAppBarActions()]),
        body: Stack(
          children: [
            PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(4, (index) {
                return TutorialLink();
              }),
            ),
          ],
        ),
        bottomNavigationBar: HomeBottomNav(
          controller: controller,
          currentIndex: pageIndex,
          onTap: (index) {
            AppLogger.d("jumpToPage $index");
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
