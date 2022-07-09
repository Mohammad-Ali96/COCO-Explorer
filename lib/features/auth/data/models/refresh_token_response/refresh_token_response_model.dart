import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response_model.g.dart';

@JsonSerializable()
class RefreshTokenResponseModel {
  final String token;
  @JsonKey(defaultValue: '')
  final String refreshToken;

  RefreshTokenResponseModel(this.token, this.refreshToken);

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
        _$RefreshTokenResponseModelFromJson(json);
}