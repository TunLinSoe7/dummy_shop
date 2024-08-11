
import 'package:dummyShop/data/vos/promo_vo.dart';

import '../vos/product_vo.dart';

abstract class ProductModel{
  //product by category
  Future<List<ProductsVO>?> fetchProductByCategoryVO(String categoryId);
  Stream<List<ProductsVO>?> getProductListFromDatabase(String productId);

  ///product detail
  Future<ProductsVO?> fetchProductDetailVO(int detailId);
  Stream<ProductsVO?> getProductsDetailFromDatabase(int detailId);

 ///promo slider
  Future<List<PromoVO>?> fetchPromoVO();

  ///favourite dao
  void saveFavourite(ProductsVO productsVO);
  Stream<List<ProductsVO>?> getFavouriteListStream();
  void removeFavourite(int id);
  bool isFavourite(int id);

}