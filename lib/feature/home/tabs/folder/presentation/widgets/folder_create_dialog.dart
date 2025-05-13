import 'package:flutter/material.dart';
import 'package:krap/common/styles/button_styles.dart';
import 'package:krap/common/styles/text_styles.dart';
import 'package:krap/common/widgets/edit_text.dart';
import 'package:krap/common/widgets/text_drop_down.dart';
import 'package:krap/feature/home/dto/create_folder_request.dart';

class FolderCreateDialog extends StatelessWidget {
  FolderCreateDialog(this.onCreate);

  final void Function(CreateFolderRequest createFolderRequest) onCreate;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  bool _selectPrivacy = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("폴더 생성"),
            EditText(
              isHighlight: true,
              hintText: '제목',
              controller: _titleController,
            ),
            EditText(hintText: '설명', controller: _descController),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextDropDown(
                    items: ['공개', '비공개'],
                    onChanged: (value) {
                      _selectPrivacy = value == '공개';
                    },
                  ),
                ),
                Expanded(flex: 2, child: SizedBox()),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton(
                      style: ButtonStyles.cancelButton,
                      child: Text('취소', style: TextStyles.semiBold12Black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      style: ButtonStyles.confirmButton,
                      child: Text('만들기', style: TextStyles.semiBold12White),
                      onPressed: () {
                        onCreate(
                          CreateFolderRequest(
                            folderName: _titleController.text,
                            folderDescription: _descController.text,
                            visible: _selectPrivacy,
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
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
    void Function(CreateFolderRequest createFolderRequest) onCreate,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => FolderCreateDialog(onCreate),
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
