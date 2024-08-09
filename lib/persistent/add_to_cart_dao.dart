import 'package:dummyShop/data/vos/product_vo.dart';

abstract class AddToCartDAO{
  void addToCart(ProductsVO productsVO);
  void removeFromCart(int productId);
  List<ProductsVO>? getCartItems();
  Stream watch();
  Stream<List<ProductsVO>?> getCartItemsStream();
  void increaseProductQuantity(int productId);
  void decreaseProductQuantity(int productId);
}