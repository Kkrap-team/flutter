import 'package:json_annotation/json_annotation.dart';

part 'Link.g.dart'; // 이게 있어야 build_runner가 연결 가능

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
  final num linkId;
  final String linkUrl;
  final String createTime;
  final String linkName;
  final String thumbnailUrl;
  final String faviconUrl;
  // 👇 이 두 줄 반드시 추가!
  factory Link.fromJson(Map<String, dynamic> json) =>
      _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}