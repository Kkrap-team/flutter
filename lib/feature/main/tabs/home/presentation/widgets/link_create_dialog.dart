import 'package:flutter/material.dart';
import 'package:krap/common/http/dto/folder.dart';
import 'package:krap/common/styles/app_colors.dart';
import 'package:krap/common/styles/button_styles.dart';
import 'package:krap/common/styles/text_styles.dart';
import 'package:krap/common/widgets/edit_text.dart';
import 'package:krap/common/widgets/text_drop_down.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/core/util/text_extention.dart';
import 'package:krap/feature/main/dto/save_link_request.dart';

class LinkSaveDialog extends StatelessWidget {
  LinkSaveDialog(this.onSave, this.folderList)
    : _selectFolder = folderList.first;

  final void Function(SaveLinkRequest saveLinkRequest) onSave;
  final List<Folder> folderList;

  final TextEditingController _linkController = TextEditingController();
  Folder _selectFolder;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 20,
          right: 20,
          bottom: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                '업로드',
                style: const TextStyle()
                    .weight(regularWeight)
                    .size(14)
                    .colors(AppColors.black),
              ),
            ),
            const SizedBox(height: 19),
            EditText(
              isOutLine: true,
              hintText: '링크 주소를 입력해 주세요.',
              controller: _linkController,
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Text(
                  '저장할 위치',
                  style: const TextStyle()
                      .weight(lightWeight)
                      .size(14)
                      .colors(AppColors.black),
                ),

                const SizedBox(width: 12),

                if (folderList.isNotEmpty)
                  Expanded(
                    flex: 1,
                    child: TextDropDown(
                      isOutLine: true,
                      items:
                          folderList
                              .map((folder) => folder.folderName)
                              .toList(),
                      initIndex: 0,
                      onChanged: (value) {
                        _selectFolder = folderList[value];
                      },
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: ButtonStyles.copyButton,
                  child: Text('붙여넣기', style: TextStyles.semiBold12Black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                ElevatedButton(
                  style: ButtonStyles.addButton,
                  child: Text('추가하기', style: TextStyles.semiBold12White),
                  onPressed: () {
                    onSave(
                      SaveLinkRequest(
                        linkUrl: _linkController.text,
                        foldersId: _selectFolder.folderId,
                        defaultFoldersId: folderList[0].folderId,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> show(
    BuildContext context,
    List<Folder> folderList,
    void Function(SaveLinkRequest saveLinkRequest) onSave,
  ) {
    AppLogger.d(
      '++ LinkSaveDialog.show() folderList = ${folderList.map((data) => data.toJson())}',
    );

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => LinkSaveDialog(onSave, folderList),
    );
  }

  static void dismiss(BuildContext context) {
    AppLogger.d('LinkSaveDialog.dismiss()');
    Navigator.of(context, rootNavigator: true).pop();
  }
}
