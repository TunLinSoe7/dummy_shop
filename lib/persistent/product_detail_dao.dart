import 'package:dummyShop/data/vos/product_vo.dart';

abstract class ProductDetailDAO{
  void save(ProductsVO productsVO);
  ProductsVO? getProductDetailFromDatabase(int detailId);
  Stream watchDetailBox();
  Stream<ProductsVO?> getProductDetailFromDatabaseStream(int detailId);

}