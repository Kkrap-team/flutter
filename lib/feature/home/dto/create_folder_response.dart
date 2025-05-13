import 'package:json_annotation/json_annotation.dart';

part 'create_folder_response.g.dart';

@JsonSerializable()
class CreateFolderResponse {
  // "folderId": 0,
  // "userId": 0,
  // "folderName": "string",
  // "folderDescription": "string",
  // "createTime": "2025-05-13T09:08:27.741Z",
  // "visible": true
  CreateFolderResponse({
    required this.folderId,
    required this.userId,
    required this.folderName,
    required this.folderDescription,
    required this.createTime,
    required this.visible,
  });

  int folderId;
  int userId;
  String folderName;
  String folderDescription;
  String createTime;
  bool visible;

  factory CreateFolderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFolderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFolderResponseToJson(this);
}
