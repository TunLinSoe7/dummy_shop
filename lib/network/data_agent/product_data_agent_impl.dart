import 'dart:convert';

import 'package:dummyShop/data/vos/category_vo/category_vo.dart';
import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/network/api/product_api.dart';
import 'package:dummyShop/network/data_agent/product_data_agent.dart';
import 'package:dummyShop/network/response/product_response.dart';
import 'package:dummyShop/utils/constants/api_constant.dart';
import 'package:http/http.dart' as http;

class ProductDataAgentImpl extends ProductDataAgent {
  ProductDataAgentImpl._();
  static final ProductDataAgentImpl _singleton = ProductDataAgentImpl._();
  factory ProductDataAgentImpl() => _singleton;

  final ProductApi _api = ProductApi();

  @override
  Future<List<ProductsVO>> fetchAllProducts() async {
    try{
     ProductResponse productResponse = await _api.fetchAllProductsResponse();
     return productResponse.products ?? [];
    }catch (e){
      throw Exception('fetch products in data agent$e');
    }
  }

  @override
  Future<List<ProductsVO>> fetchProductByCategoryVO(String categoryId) async {
    try{
     ProductResponse productResponse = await _api.fetchProductsByCategoryResponse(categoryId);
     return productResponse.products ?? [];
    }catch (e){
      throw Exception('fetch products in data agent$e');
    }
  }

  @override
  Future<List<CategoryVO>?> fetchCategories()async {
    try{
      final response = await http.get(Uri.parse(kBaseUrl+kCategoryEndPoint));
      if(response.statusCode == 200){
        final List jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((json) => CategoryVO.fromJson(json)).toList();
      }else{
        throw Exception('Failed to fetch categories');
      }
    }catch (e){
      throw Exception('Failed to fetch categories : $e');
    }
  }

  @override
  Future<ProductsVO?> fetchProductsDetail(int productId)async{
    try{
      return await _api.fetchProductsDetails(productId);
    }catch(e){
      throw Exception('Failed details $e');
    }
  }

  @override
  Future<List<ProductsVO>?> fetchProductsSearch(String query) async{
    try{
      return await _api.fetchSearchProductsResponse(query).then((value) => value.products);
    }catch(e){
      throw Exception('Failed search products $e');
    }
  }


  }
