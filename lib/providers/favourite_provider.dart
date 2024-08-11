import 'package:flutter/material.dart';

import '../data/model/product_model.dart';
import '../data/model/product_model_impl.dart';
import '../data/vos/product_vo.dart';

class FavouriteProvider extends ChangeNotifier{
  bool _isDispose = false;
  List<ProductsVO>? favouriteList = [];
  final ProductModel _productModel = ProductModelImpl();
  FavouriteProvider(){
    _productModel.getFavouriteListStream().listen((event) {
      if(event!=null){
        favouriteList = event;
      }
      notifyListeners();
    });
  }

  bool isFavourite(int id){
    return _productModel.isFavourite(id);
  }

  void toggleFavourite(ProductsVO productsVO){
    if(_productModel.isFavourite(productsVO.id ?? 0)){
      _productModel.removeFavourite(productsVO.id ?? 0);
    }else{
      _productModel.saveFavourite(productsVO);
    }
    notifyListeners();
  }

 @override
  void notifyListeners() {
    // TODO: implement
   if(!_isDispose){
     super.notifyListeners();
   }
  }
}