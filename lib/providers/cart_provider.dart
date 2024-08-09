import 'package:dummyShop/data/model/add_to_cart_model.dart';
import 'package:dummyShop/data/model/add_to_cart_model_impl.dart';
import 'package:flutter/material.dart';
import '../data/vos/product_vo.dart';

class CartProvider extends ChangeNotifier{
  final AddToCartModel _addToCartModel = AddToCartModelImpl();
  List<ProductsVO>? cartItems = [];
  int count = 1;

  void saveToCart(ProductsVO productsVO){
    _addToCartModel.addToCart(productsVO);
    notifyListeners();
  }

  void increase(ProductsVO productsVO) {
    productsVO.quantity = (productsVO.quantity ?? 0) + 1;
    notifyListeners();
  }
  void decrease(ProductsVO productsVO) {
    if (productsVO.quantity != null && (productsVO.quantity ?? 0) > 1) {
      productsVO.quantity = (productsVO.quantity ?? 0) - 1;
    }
    notifyListeners();
  }


  void removeFromCart(int productId){
    _addToCartModel.removeFromCart(productId);
    notifyListeners();
  }

  void increaseQuantity(int productId){
    _addToCartModel.increaseProductQuantity(productId);
    notifyListeners();
  }
  void decreaseQuantity(int productId){
    _addToCartModel.decreaseProductQuantity(productId);
    notifyListeners();
  }

  CartProvider(){
    _addToCartModel.getCartItemsStream().listen((event) {
      cartItems = event;
      notifyListeners();
    });
  }

}