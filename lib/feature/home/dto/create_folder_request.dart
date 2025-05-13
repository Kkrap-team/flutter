import 'package:json_annotation/json_annotation.dart';

part 'create_folder_request.g.dart';

@JsonSerializable()
class CreateFolderRequest {
  // "folderName": "string",
  // "folderDescription": "string",
  // "visible": true
  CreateFolderRequest({
    required this.folderName,
    required this.folderDescription,
    required this.visible,
  });

  String folderName;
  String folderDescription;
  bool visible;

  factory CreateFolderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFolderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFolderRequestToJson(this);
}
