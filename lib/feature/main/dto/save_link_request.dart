import 'package:json_annotation/json_annotation.dart';

part 'save_link_request.g.dart';

@JsonSerializable()
class SaveLinkRequest {
  // "linkUrl": "string",
  // "foldersId": 0,
  // "defaultFoldersId": 0
  SaveLinkRequest({
    required this.linkUrl,
    required this.foldersId,
    required this.defaultFoldersId,
  });

  String linkUrl;
  int foldersId;
  int defaultFoldersId;

  factory SaveLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveLinkRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaveLinkRequestToJson(this);
}
