import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/persistent/product_detail_dao.dart';
import 'package:dummyShop/utils/constants/hive_constant.dart';
import 'package:hive/hive.dart';

class ProductDetailDAOImpl extends ProductDetailDAO{
  ProductDetailDAOImpl._();
  static final ProductDetailDAOImpl _singleton = ProductDetailDAOImpl._();
  factory ProductDetailDAOImpl()=>_singleton;

  @override
  ProductsVO? getProductDetailFromDatabase(int detailId) =>_detailBox().get(detailId);
  @override
  Stream<ProductsVO?> getProductDetailFromDatabaseStream(int detailId) =>Stream.value(getProductDetailFromDatabase(detailId));

  @override
  void save(ProductsVO productsVO) {
   _detailBox().put(productsVO.id, productsVO);
  }

  @override
  Stream watchDetailBox()=>_detailBox().watch();
  Box<ProductsVO> _detailBox()=>Hive.box(kBoxNameForProductVODetail);
}