import 'package:e_commerce/domain/entity/auth/register/RegisterResponseEntity.dart';

class AuthResultEntity {
  UserEntity? userEntity;
  String? token;

  AuthResultEntity({this.userEntity, this.token});
}
