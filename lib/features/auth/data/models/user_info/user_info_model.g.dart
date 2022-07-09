// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      json['id'] as int?,
      UserPersonalInfoModel.fromJson(
          json['personalInfo'] as Map<String, dynamic>),
      json['email'] as String?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'personalInfo': instance.personalInfo,
    };
