import 'dart:convert';
import 'package:dummyShop/network/response/product_response.dart';
import 'package:dummyShop/utils/constants/api_constant.dart';
import 'package:http/http.dart' as http;

class ProductApi{
  ProductApi._();
  static final ProductApi _singleton = ProductApi._();
  factory ProductApi()=>_singleton;

  Future<ProductResponse> fetchAllProductsResponse()async{
    try{
      final response =await http.get(Uri.parse(kBaseUrl));
      if(response.statusCode == 200){
        final jsonResponse = json.decode(response.body);
        ProductResponse productResponse = ProductResponse.fromJson(jsonResponse);
        return productResponse;
      }else{
        throw Exception('Failed to load response.');
      }
    }catch (e){
      throw Exception('Failed to fetch response : $e');
    }
  }

  Future<ProductResponse> fetchProductsByCategoryResponse(String categoryId)async{
    try{
      final response =await http.get(Uri.parse('${kBaseUrl+kProductByCategoryEndPoint}/$categoryId'));
      if(response.statusCode == 200){
        final jsonResponse = json.decode(response.body);
        ProductResponse productResponse = ProductResponse.fromJson(jsonResponse);
        return productResponse;
      }else{
        throw Exception('Failed to load response.');
      }
    }catch (e){
      throw Exception('Failed to fetch response : $e');
    }
  }

}