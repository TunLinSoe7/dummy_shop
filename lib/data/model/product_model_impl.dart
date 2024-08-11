import 'package:dummyShop/data/model/product_model.dart';
import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/data/vos/promo_vo.dart';
import 'package:dummyShop/network/data_agent/product_data_agent.dart';
import 'package:dummyShop/network/data_agent/product_data_agent_impl.dart';
import 'package:dummyShop/persistent/favourite_dao.dart';
import 'package:dummyShop/persistent/favourite_dao_impl.dart';
import 'package:dummyShop/persistent/product_dao.dart';
import 'package:dummyShop/persistent/product_dao_impl.dart';
import 'package:dummyShop/persistent/product_detail_dao.dart';
import 'package:dummyShop/persistent/product_detail_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

class ProductModelImpl extends ProductModel{

  ProductModelImpl._();
  static final ProductModelImpl _singleton = ProductModelImpl._();
  factory ProductModelImpl()=>_singleton;

  final ProductDataAgent _dataAgent = ProductDataAgentImpl();
  final ProductDAO _productDAO = ProductDAOImpl();
  final FavouriteDAO _favouriteDAO = FavouriteDAOImpl();
  final ProductDetailDAO _productDetailDAO = ProductDetailDAOImpl();
  @override
  Future<List<ProductsVO>?> fetchProductByCategoryVO(String categoryId) =>_dataAgent.fetchProductByCategoryVO(categoryId).then((value) {
    if(value !=null){
      _productDAO.save(value);
    }
    return value;
  });

  @override
  Stream<List<ProductsVO>?> getProductListFromDatabase(String productId) =>
              _productDAO.watchProductBox()
              .startWith(_productDAO.getProductListFromDatabaseStream(productId))
              .map((event) => _productDAO.getProductListFromDatabase(productId));
  //detail
  @override
  Future<ProductsVO?> fetchProductDetailVO(int detailId)=>_dataAgent.fetchProductsDetail(detailId).then((value) {
    if(value !=null){
      _productDetailDAO.save(value);
    }
    return value;
  });

  @override
  Stream<ProductsVO?> getProductsDetailFromDatabase(int detailId) =>_productDetailDAO.watchDetailBox()
      .startWith(_productDetailDAO.getProductDetailFromDatabaseStream(detailId))
      .map((event) => _productDetailDAO.getProductDetailFromDatabase(detailId));

  @override
  Future<List<PromoVO>?> fetchPromoVO() =>_dataAgent.fetchPromoVO();

  @override
  Stream<List<ProductsVO>?> getFavouriteListStream() =>_favouriteDAO.watchFavouriteBox()
      .startWith(_favouriteDAO.getFavouriteListStream())
      .map((event) => _favouriteDAO.favouriteList());

  @override
  void removeFavourite(int id) =>_favouriteDAO.removeFavourite(id);

  @override
  void saveFavourite(ProductsVO productsVO)=>_favouriteDAO.save(productsVO);

  @override
  bool isFavourite(int id)=>_favouriteDAO.isFavourite(id);
}
