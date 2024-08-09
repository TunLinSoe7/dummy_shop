
import '../vos/product_vo.dart';

abstract class ProductModel{
  //product by category
  Future<List<ProductsVO>?> fetchProductByCategoryVO(String categoryId);
  Stream<List<ProductsVO>?> getProductListFromDatabase(String productId);

  ///product detail
  Future<ProductsVO?> fetchProductDetailVO(int detailId);
  Stream<ProductsVO?> getProductsDetailFromDatabase(int detailId);

  // /// add to cart
  // void saveToCart(ProductsVO productsVO);
  // Stream<List<ProductsVO>?> getCartListFromDatabase();
  // void removeItem(int id);

}