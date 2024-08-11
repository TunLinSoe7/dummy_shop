import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/persistent/favourite_dao.dart';
import 'package:dummyShop/utils/constants/hive_constant.dart';
import 'package:hive_flutter/adapters.dart';

class FavouriteDAOImpl extends FavouriteDAO{
  FavouriteDAOImpl._();
  static final FavouriteDAOImpl _singleton = FavouriteDAOImpl._();
  factory FavouriteDAOImpl()=>_singleton;

  @override
  Stream<List<ProductsVO>?> getFavouriteListStream() =>Stream.value(favouriteList());

  @override
  void save(ProductsVO productsVO) {
   _box().put(productsVO.id, productsVO);
  }

  @override
  Stream watchFavouriteBox() =>_box().watch();

  Box<ProductsVO> _box()=>Hive.box<ProductsVO>(kBoxNameForFavourite);

  @override
  List<ProductsVO>? favouriteList() =>_box().values.toList();

  @override
  void removeFavourite(int id) =>_box().delete(id);

  @override
  bool isFavourite(int id) =>_box().containsKey(id);
}