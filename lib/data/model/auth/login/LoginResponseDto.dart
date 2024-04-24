import 'package:e_commerce/data/model/auth/register/RegisterResopnseDto.dart';
import 'package:e_commerce/domain/entity/auth/auth_result_entity.dart';

class LoginResponseDto {
  LoginResponseDto({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  UserDto? user;
  String? token;
  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
      userEntity: user?.toUserEntity(),
      token: token,
    );
  }
}
