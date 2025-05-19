import 'package:json_annotation/json_annotation.dart';
import 'package:krap/common/http/dto/link.dart';

part 'folder.g.dart';

@JsonSerializable()
class Folder {

  Folder({
    required this.folderId,
    required this.folderName,
    required this.folderDescription,
    required this.visible,
    required this.createTime,
    required this.links,
  });

  final int folderId;
  final String folderName;
  final String folderDescription;
  final bool visible;
  final String createTime;
  final List<Link> links;

  factory Folder.fromJson(Map<String, dynamic> json) =>
      _$FolderFromJson(json);

  Map<String, dynamic> toJson() => _$FolderToJson(this);
}
