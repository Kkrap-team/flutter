import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  UserInfo({
    required this.userId,
    required this.email,
    required this.nickname,
    required this.profile,
    required this.bio,
    required this.kakaoId,
  });

  final int userId;
  final String email;
  final String nickname;
  final String profile;
  final String? bio;
  final int kakaoId;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
