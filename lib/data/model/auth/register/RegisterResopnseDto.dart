import 'package:e_commerce/data/model/erorr/Erorr.dart';
import 'package:e_commerce/domain/entity/auth/auth_result_entity.dart';
import 'package:e_commerce/domain/entity/auth/register/RegisterResponseEntity.dart';

class RegisterResponseDto {
  RegisterResponseDto({
    this.message,
    this.user,
    this.error,
    this.statusMsg,
    this.token,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Erorr.fromJson(json['errors']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Erorr? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity(),
    );
  }
}

class UserDto {
  UserDto({
    this.name,
    this.email,
    this.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserEntity toUserEntity() {
    return UserEntity(name: name, email: email);
  }
}
