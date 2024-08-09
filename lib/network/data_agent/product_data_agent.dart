
import 'package:dummyShop/data/vos/category_vo/category_vo.dart';
import 'package:dummyShop/data/vos/product_vo.dart';

abstract class ProductDataAgent{
  Future<List<ProductsVO>?> fetchProductByCategoryVO(String categoryId);
  Future<List<ProductsVO>?> fetchAllProducts();

  Future<List<CategoryVO>?> fetchCategories();
  Future<ProductsVO?> fetchProductsDetail(int productId);
  Future<List<ProductsVO>?> fetchProductsSearch(String query);
}