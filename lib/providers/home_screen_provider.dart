
import 'package:dummyShop/data/vos/category_vo/category_vo.dart';
import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/network/data_agent/product_data_agent.dart';
import 'package:dummyShop/network/data_agent/product_data_agent_impl.dart';
import 'package:flutter/material.dart';


class HomeScreenProvider extends ChangeNotifier {
  final ProductDataAgent _dataAgent = ProductDataAgentImpl();
  bool _isLoading = false;
  List<ProductsVO>? products = [];
  List<ProductsVO> productsByCategory = [];

 int selectedIndex = 0;
 List<CategoryVO> categories = [];

  bool get isLoading => _isLoading;

  HomeScreenProvider(){
    fetchCategories();
    fetchAllProducts();
  }
  void setSelectedCategory(int index) {
    selectedIndex = index;
    fetchProductByCategory(categories[selectedIndex].slug ?? '');
    notifyListeners();
  }

  Future<void> fetchAllProducts()async{
    _isLoading = true;
    notifyListeners();
    try{
      await _dataAgent.fetchAllProducts().then((value) {
        products = value;
        _isLoading = false;
        notifyListeners();
      });
    }catch(e){
      throw Exception('Failed=====================> $e');
    }
  }
  // fetch product by category
  Future<void> fetchProductByCategory(String categoryId)async{
    _isLoading = true;
    notifyListeners();
    try{
      await _dataAgent.fetchProductByCategoryVO(categoryId).then((value) {
        productsByCategory = value;
        _isLoading = false;
        notifyListeners();
      });
    }catch(e){
      throw Exception('Failed $e');
    }
  }

  Future<void> fetchCategories()async{
    _isLoading = true;

    notifyListeners();
    try{
      await _dataAgent.fetchCategories().then((value) {
        if(value !=null){
          categories =value;
          fetchProductByCategory(categories[selectedIndex].slug ?? '');
        }
        _isLoading = false;
        notifyListeners();
      });
    }catch (e){
      throw Exception('Failed $e');
    }
  }

}
