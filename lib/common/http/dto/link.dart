import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable()
class Link{

  Link({
     required this.linkId,
     required this.linkUrl,
     required this.createTime,
     required this.linkName,
     required this.thumbnailUrl,
     required this.faviconUrl,
});

  final int linkId;
  final String linkUrl;
  final String createTime;
  final String linkName;
  final String thumbnailUrl;
  final String faviconUrl;

  factory Link.fromJson(Map<String, dynamic> json) =>
      _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}