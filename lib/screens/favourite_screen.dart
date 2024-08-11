import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/providers/favourite_provider.dart';
import 'package:dummyShop/utils/item_views/product_item_views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(builder: (_,provider,__)=>Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: Column(
        children: [
          Expanded(child: GridView.builder(
              itemCount: provider.favouriteList?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 210,
                  crossAxisCount: 2),
              itemBuilder:(_,index){
                return ProductItemViews(imageUrl: '${provider.favouriteList?[index].thumbnail}', title: "Apple", rating: '0', price: '44', onTap: (){}, onPressed: () {
                  provider.toggleFavourite(provider.favouriteList?[index] ?? ProductsVO(),);
                },
                  isFavourite: provider.isFavourite(provider.favouriteList?[index].id ?? 0),
                );
              } ))
        ],
      ),
    ));
  }
}
