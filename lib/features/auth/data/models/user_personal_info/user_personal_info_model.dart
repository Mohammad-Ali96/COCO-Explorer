import 'package:coco_explorer/features/auth/domain/entities/user_personal_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_personal_info_model.g.dart';

@JsonSerializable(createToJson: true)
class UserPersonalInfoModel {
  int? id;

  UserPersonalInfoModel(this.id);

  factory UserPersonalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserPersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPersonalInfoModelToJson(this);
}

extension MapUserPersonalInfoModelToDomain on UserPersonalInfoModel {
  UserPersonalInfo toDomain() => UserPersonalInfo(id);
}
