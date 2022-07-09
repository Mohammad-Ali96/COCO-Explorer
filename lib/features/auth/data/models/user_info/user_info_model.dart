import 'package:coco_explorer/features/auth/data/models/user_personal_info/user_personal_info_model.dart';
import 'package:coco_explorer/features/auth/domain/entities/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable(createToJson: true)
class UserInfoModel {
  final int? id;
  final String? email;
  final UserPersonalInfoModel personalInfo;


  UserInfoModel(
    this.id,
    this.personalInfo,
    this.email,
  );

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);

  UserInfoModel copyWith({
    int? id,
    String? email,
    UserPersonalInfoModel? personalInfo,
  }) {
    return UserInfoModel(
      id ?? this.id,
      personalInfo ?? this.personalInfo,
      email ?? this.email,
    );
  }
}

extension MapUserInfoModelToDomain on UserInfoModel {
  UserInfo toDomain() => UserInfo(
        id,
        personalInfo.toDomain(),
        email,
      );
}
