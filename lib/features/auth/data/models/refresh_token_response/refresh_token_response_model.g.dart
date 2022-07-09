// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenResponseModel _$RefreshTokenResponseModelFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenResponseModel(
      json['token'] as String,
      json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$RefreshTokenResponseModelToJson(
        RefreshTokenResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
