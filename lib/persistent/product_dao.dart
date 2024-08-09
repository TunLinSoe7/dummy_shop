import '../data/vos/product_vo.dart';

abstract class ProductDAO{
  void save(List<ProductsVO> productList);
  List<ProductsVO>? getProductListFromDatabase(String productId);
  Stream watchProductBox();
  Stream<List<ProductsVO>?> getProductListFromDatabaseStream(String productId);
}