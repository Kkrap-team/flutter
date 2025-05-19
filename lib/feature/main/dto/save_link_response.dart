import 'package:json_annotation/json_annotation.dart';

part 'save_link_response.g.dart';

@JsonSerializable()
class SaveLinkResponse {
  // "foldersId": 0,
  // "defaultFoldersId": 0,
  // "linkUrl": "string",
  // "createTime": "2025-05-16T17:12:30.928Z",
  // "linkName": "string",
  // "thumbnailUrl": "string",
  // "faviconUrl": "string"
  SaveLinkResponse({
    required this.foldersId,
    required this.defaultFoldersId,
    required this.linkUrl,
    required this.createTime,
    required this.linkName,
    required this.thumbnailUrl,
    required this.faviconUrl,
  });

  int foldersId;
  int defaultFoldersId;
  String linkUrl;
  String createTime;
  String linkName;
  String thumbnailUrl;
  String faviconUrl;

  factory SaveLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveLinkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaveLinkResponseToJson(this);
}
