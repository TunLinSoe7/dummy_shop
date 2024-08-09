import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/persistent/product_dao.dart';
import 'package:dummyShop/utils/constants/hive_constant.dart';
import 'package:hive/hive.dart';

class ProductDAOImpl extends ProductDAO{
  ProductDAOImpl._();
  static final ProductDAOImpl _singleton = ProductDAOImpl._();
  factory ProductDAOImpl()=>_singleton;

  @override
  List<ProductsVO>? getProductListFromDatabase(String productId) {
    if(productId.isEmpty){
      return _productBox().values.toList();
    }else{
      return _productBox().values.where((element) => element.category == productId).toList();
    }
  }

  @override
  Stream<List<ProductsVO>?> getProductListFromDatabaseStream(String productId) =>Stream.value(getProductListFromDatabase(productId));

  @override
  void save(List<ProductsVO> productList) {
    for(ProductsVO productsVO in productList){
      _productBox().put(productsVO.id, productsVO);
    }
  }

  @override
  Stream watchProductBox() =>_productBox().watch();

  Box<ProductsVO> _productBox() =>Hive.box(kBoxNameForProductVO);
}