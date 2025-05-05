import 'package:json_annotation/json_annotation.dart';

part 'folder.g.dart';

@JsonSerializable()
class Folder {

  Folder({
    required this.folderId,
    required this.folderName,
    required this.folderDescription,
    required this.visible,
    required this.eTime,
    required this.links,
  });

  final num folderId;
  final String folderName;
  final String folderDescription;
  final bool visible;
  final String eTime;
  final List<String> links;

  factory Folder.fromJson(Map<String, dynamic> json) =>
      _$FolderFromJson(json);

  Map<String, dynamic> toJson() => _$FolderToJson(this);
}
