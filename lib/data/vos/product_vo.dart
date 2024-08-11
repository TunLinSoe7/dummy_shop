import 'package:dummyShop/data/vos/reviews_vo.dart';
import 'package:dummyShop/utils/constants/hive_constant.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dimensions_vo.dart';
import 'meta_vo.dart';
part 'product_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeForProductVO)
class ProductsVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? title;
  @JsonKey(name: 'description')
  @HiveField(2)
  String? description;
  @JsonKey(name: 'category')
  @HiveField(3)
  String? category;
  @JsonKey(name: 'price')
  @HiveField(4)
  double? price;
  @JsonKey(name: 'discountPercentage')
  @HiveField(5)
  double? discountPercentage;
  @JsonKey(name: 'rating')
  @HiveField(6)
  double? rating;
  @JsonKey(name: 'stock')
  @HiveField(7)
  int? stock;
  @JsonKey(name: 'tags')
  @HiveField(8)
  List<String>? tags;
  @JsonKey(name: 'brand')
  @HiveField(9)
  String? brand;
  @JsonKey(name: 'sku')
  @HiveField(10)
  String? sku;
  @JsonKey(name: 'weight')
  @HiveField(11)
  int? weight;
  @JsonKey(name: 'dimension')
  @HiveField(12)
  DimensionsVO? dimensions;
  @JsonKey(name: 'warrantyInformation')
  @HiveField(13)
  String? warrantyInformation;
  @JsonKey(name: 'shippingInformation')
  @HiveField(14)
  String? shippingInformation;
  @JsonKey(name: 'availabilityStatus')
  @HiveField(15)
  String? availabilityStatus;
  @JsonKey(name: 'reviews')
  @HiveField(16)
  List<ReviewsVO>? reviews;
  @JsonKey(name: 'returnPolicy')
  @HiveField(17)
  String? returnPolicy;
  @JsonKey(name: 'minimumOrderQuantity')
  @HiveField(18)
  int? minimumOrderQuantity;
  @JsonKey(name: 'meta')
  @HiveField(19)
  MetaVO? meta;
  @JsonKey(name: 'images')
  @HiveField(20)
  List<String>? images;
  @JsonKey(name: 'thumbnail')
  @HiveField(21)
  String? thumbnail;
  @HiveField(22)
  int quantity;

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
        this.thumbnail,
        this.quantity=1,
      });

  factory ProductsVO.fromJson(Map<String, dynamic> json) =>_$ProductsVOFromJson(json);

  Map<String, dynamic> toJson() =>_$ProductsVOToJson(this);
}
