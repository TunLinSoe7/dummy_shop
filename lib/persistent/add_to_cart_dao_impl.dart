import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/persistent/add_to_cart_dao.dart';
import 'package:dummyShop/utils/constants/hive_constant.dart';
import 'package:hive/hive.dart';

class AddToCartDAOImpl extends AddToCartDAO{


  @override
  Stream<List<ProductsVO>?> getCartItemsStream() =>Stream.value(getCartItems());

  @override
  Stream watch()=>_cartBox().watch();

  Box<ProductsVO> _cartBox()=>Hive.box<ProductsVO>(kBoxNameForAddToCart);

  @override
  void addToCart(ProductsVO productsVO) {
    if (_cartBox().containsKey(productsVO.id)) {
      ProductsVO existingProduct = _cartBox().get(productsVO.id)!;
      existingProduct.quantity = (existingProduct.quantity) + 1;
      _cartBox().put(productsVO.id, existingProduct);
    } else {
      _cartBox().put(productsVO.id, productsVO);
    }
  }

  @override
  List<ProductsVO>? getCartItems()=>_cartBox().values.toList();

  @override
  void removeFromCart(int productId) {
    _cartBox().delete(productId);
  }

  @override
  void increaseProductQuantity(int productId) {
    if (_cartBox().containsKey(productId)) {
      ProductsVO existingProduct = _cartBox().get(productId)!;
      existingProduct.quantity = (existingProduct.quantity) + 1;
      _cartBox().put(productId, existingProduct);
    }
  }

  @override
  void decreaseProductQuantity(int productId) {
    if (_cartBox().containsKey(productId)) {
      ProductsVO existingProduct = _cartBox().get(productId)!;
      if(existingProduct.quantity>1){
        existingProduct.quantity = (existingProduct.quantity) - 1;
        _cartBox().put(productId, existingProduct);
      }
    }
  }
  
}