import 'package:dummyShop/data/vos/product_vo.dart';

abstract class FavouriteDAO{
  void save(ProductsVO productsVO);
  List<ProductsVO>? favouriteList();
  void removeFavourite(int id);
  bool isFavourite(int id);
  Stream watchFavouriteBox();
  Stream<List<ProductsVO>?> getFavouriteListStream();
}