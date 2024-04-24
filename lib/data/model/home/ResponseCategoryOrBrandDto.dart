import 'package:e_commerce/domain/entity/home/ResponseCategoryEntity.dart';

class ResponseCategoryOrBrandDto extends ResponseCategoryOrBrandEntity {
  ResponseCategoryOrBrandDto({
    super.results,
    this.statusMsg,
    this.message,
    super.data,
  });

  ResponseCategoryOrBrandDto.fromJson(dynamic json) {
    results = json['results'];
    json['message'] = message;
    json['statusMsg'] = statusMsg;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDto.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class CategoryOrBrandDto extends CategoryOrBrandEntity {
  CategoryOrBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryOrBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}
