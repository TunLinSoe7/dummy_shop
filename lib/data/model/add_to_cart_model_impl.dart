import 'package:dummyShop/data/model/add_to_cart_model.dart';
import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/persistent/add_to_cart_dao.dart';
import 'package:dummyShop/persistent/add_to_cart_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

class AddToCartModelImpl extends AddToCartModel{
  final AddToCartDAO _addToCartDAO = AddToCartDAOImpl();
  @override
  void addToCart(ProductsVO productsVO)=>_addToCartDAO.addToCart(productsVO);

  @override
  List<ProductsVO>? getCartItems() =>_addToCartDAO.getCartItems();

  @override
  Stream<List<ProductsVO>?> getCartItemsStream() =>_addToCartDAO.watch()
      .startWith(_addToCartDAO.getCartItemsStream())
      .map((event) => _addToCartDAO.getCartItems());

  @override
  void decreaseProductQuantity(int productId) =>_addToCartDAO.decreaseProductQuantity(productId);

  @override
  void increaseProductQuantity(int productId) =>_addToCartDAO.increaseProductQuantity(productId);

  @override
  void removeFromCart(int productId) =>_addToCartDAO.removeFromCart(productId);

}