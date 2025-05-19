import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/http/provider/folder_list_provider.dart';
import 'package:krap/common/http/provider/user_provider.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/feature/main/tabs/folder/presentation/widgets/my_folder.dart';
import 'package:krap/feature/main/tabs/home/presentation/widgets/link_create_dialog.dart';
import 'package:krap/feature/main/tabs/home/provider/home_viewmodel_provider.dart';
import 'package:krap/feature/main/tabs/home/viewmodel/home_viewmodel.dart';

class HomeTab extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  late final HomeViewmodel viewModel;
  late final int userId;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final userId = ref.read(userProvider).value?.userId;
      if (userId != null) {
        ref.read(folderProvider.notifier).fetchFolder(userId);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userId = ref
        .watch(userProvider)
        .maybeWhen(data: (user) => user?.userId ?? 0, orElse: () => 0);

    viewModel = ref.read(homeViewModelProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final folderState = ref.watch(folderProvider);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: folderState.when(
          data:
              (folderList) => FloatingActionButton(
                backgroundColor: AppColors.primary,
                shape: const CircleBorder(),
                onPressed: () {
                  LinkSaveDialog.show(context, folderList ?? [], (
                    createFolderRequest,
                  ) {
                    viewModel.saveLink(userId, createFolderRequest);
                    AppLogger.d(
                      '++LinkCreateDialog onCreate() ${createFolderRequest.toJson()}',
                    );
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(11),
                  child: Image.asset('assets/images/icon_plus.png'),
                ),
              ),
          loading: () => const SizedBox(),
          error: (e, st) => const SizedBox(),
        ),
        body: Stack(fit: StackFit.expand, children: [MyFolder()]),
      ),
    );
  }
}
