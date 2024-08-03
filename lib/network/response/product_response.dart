import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: 'products')
  List<ProductsVO>? products;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'skip')
  int? skip;
  @JsonKey(name: 'limit')
  int? limit;

  ProductResponse({this.products, this.total, this.skip, this.limit});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>_$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$ProductResponseToJson(this);
}