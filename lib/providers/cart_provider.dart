import 'package:dummyShop/data/model/add_to_cart_model.dart';
import 'package:dummyShop/data/model/add_to_cart_model_impl.dart';
import 'package:flutter/material.dart';
import '../data/vos/product_vo.dart';

class CartProvider extends ChangeNotifier{
  final AddToCartModel _addToCartModel = AddToCartModelImpl();
  List<ProductsVO>? cartItems = [];

  void saveToCart(ProductsVO productsVO){
    _addToCartModel.addToCart(productsVO);
    notifyListeners();
  }

  double totalPrice() {
    double total = 0;
    for(var cartItem in cartItems!){
      total += cartItem.price! * cartItem.quantity;
    }
    return total;
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