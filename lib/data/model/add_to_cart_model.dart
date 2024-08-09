import 'package:dummyShop/data/vos/product_vo.dart';

abstract class AddToCartModel{
  void addToCart(ProductsVO productsVO);
  List<ProductsVO>? getCartItems();
  Stream<List<ProductsVO>?> getCartItemsStream();
  void removeFromCart(int productId);
  void increaseProductQuantity(int productId);
  void decreaseProductQuantity(int productId);

}