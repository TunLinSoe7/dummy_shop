import 'package:dummyShop/data/vos/reviews_vo.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dimensions_vo.dart';
import 'meta_vo.dart';
part 'product_vo.g.dart';

@JsonSerializable()
class ProductsVO {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'discountPercentage')
  double? discountPercentage;
  @JsonKey(name: 'rating')
  double? rating;
  @JsonKey(name: 'stock')
  int? stock;
  @JsonKey(name: 'tags')
  List<String>? tags;
  @JsonKey(name: 'brand')
  String? brand;
  @JsonKey(name: 'sku')
  String? sku;
  @JsonKey(name: 'weight')
  int? weight;
  @JsonKey(name: 'dimension')
  DimensionsVO? dimensions;
  @JsonKey(name: 'warrantyInformation')
  String? warrantyInformation;
  @JsonKey(name: 'shippingInformation')
  String? shippingInformation;
  @JsonKey(name: 'availabilityStatus')
  String? availabilityStatus;
  @JsonKey(name: 'reviews')
  List<ReviewsVO>? reviews;
  @JsonKey(name: 'returnPolicy')
  String? returnPolicy;
  @JsonKey(name: 'minimumOrderQuantity')
  int? minimumOrderQuantity;
  @JsonKey(name: 'meta')
  MetaVO? meta;
  @JsonKey(name: 'images')
  List<String>? images;
  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  ProductsVO(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.tags,
        this.brand,
        this.sku,
        this.weight,
        this.dimensions,
        this.warrantyInformation,
        this.shippingInformation,
        this.availabilityStatus,
        this.reviews,
        this.returnPolicy,
        this.minimumOrderQuantity,
        this.meta,
        this.images,
        this.thumbnail});

  factory ProductsVO.fromJson(Map<String, dynamic> json) =>_$ProductsVOFromJson(json);

  Map<String, dynamic> toJson() =>_$ProductsVOToJson(this);
}