
import 'package:dummyShop/data/model/product_model.dart';
import 'package:dummyShop/data/model/product_model_impl.dart';
import 'package:dummyShop/data/vos/category_vo/category_vo.dart';
import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/data/vos/promo_vo.dart';
import 'package:dummyShop/network/data_agent/product_data_agent.dart';
import 'package:dummyShop/network/data_agent/product_data_agent_impl.dart';
import 'package:flutter/material.dart';


class HomeScreenProvider extends ChangeNotifier {
  final ProductDataAgent _dataAgent = ProductDataAgentImpl();
  final ProductModel _productModel = ProductModelImpl();
  List<PromoVO>? products = [];
  List<ProductsVO>? productsByCategory = [];

 int selectedIndex = 0;
 List<CategoryVO>? categories = [];


  HomeScreenProvider(){
    fetchCategories();
   fetchPromoProducts();
  }
  void setSelectedCategory(int index) {
    selectedIndex = index;
    fetchProductByCategory(categories?[selectedIndex].slug ?? '');
    notifyListeners();
  }


  Future<void> fetchPromoProducts()async{
    notifyListeners();
    try{
      await _dataAgent.fetchPromoVO().then((value) {
        products = value;
        notifyListeners();
      });
    }catch(e){
      throw Exception('Failed Promo=====================> $e');
    }
  }
  // fetch product by category
  Future<void> fetchProductByCategory(String categoryId)async{
    try{
      _productModel.fetchProductByCategoryVO(categoryId);
      _productModel.getProductListFromDatabase(categoryId).listen((event) {
        productsByCategory = event ?? [];
        notifyListeners();
      });
    }catch(e){
      throw Exception('Failed $e');
    }
  }

  Future<void> fetchCategories()async{

    notifyListeners();
    try{
      await _dataAgent.fetchCategories().then((value) {
        if(value !=null){
          categories =value;
          fetchProductByCategory(categories?[selectedIndex].slug ?? '');
        }
        notifyListeners();
      });
    }catch (e){
      throw Exception('Failed $e');
    }
  }



}
