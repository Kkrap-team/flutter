import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/provider/user_provider.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/common/widgets/loading_dialog.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/feature/home/tabs/folder/presentation/widgets/folder_create_dialog.dart';
import 'package:krap/feature/home/tabs/folder/presentation/widgets/my_folder.dart';
import 'package:krap/feature/home/tabs/folder/provider/folder_viewmodel_provider.dart';
import 'package:krap/feature/home/tabs/folder/viewmodel/folder_viewmodel.dart';

class ForderTab extends ConsumerStatefulWidget {
  const ForderTab({super.key});

  @override
  ConsumerState<ForderTab> createState() => _ForderTabState();
}

class _ForderTabState extends ConsumerState<ForderTab> {
  late final FolderViewModel viewModel;
  late final int userId;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userId = ref
        .watch(userProvider)
        .maybeWhen(data: (user) => user?.userId ?? 0, orElse: () => 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = ref.read(folderViewModelProvider.notifier);

    ref.listen<AsyncValue<void>>(folderViewModelProvider, (prev, next) {
      next.whenOrNull(
        loading: () {
          LoadingDialog.show(context);
        },
        data: (_) {
          LoadingDialog.dismiss(context);
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          shape: const CircleBorder(),
          onPressed: () {
            FolderCreateDialog.show(context, (createFolderRequest) {
              AppLogger.d(
                "++FolderCreateDialog onCreate() ${createFolderRequest.toJson()}",
              );
              viewModel.createFolder(userId, createFolderRequest);
            });
          },
          child: Padding(
            padding: EdgeInsets.all(11),
            child: Image.asset('assets/images/icon_plus.png'),
          ),
        ),
        body: Stack(fit: StackFit.expand, children: [MyFolder()]),
      ),
    );
  }
}
