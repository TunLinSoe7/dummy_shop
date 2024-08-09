import 'package:dummyShop/data/vos/dimensions_vo.dart';
import 'package:dummyShop/data/vos/meta_vo.dart';
import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/data/vos/reviews_vo.dart';
import 'package:dummyShop/data/vos/search_history/search_history.dart';
import 'package:dummyShop/navigation_menu.dart';
import 'package:dummyShop/providers/cart_provider.dart';
import 'package:dummyShop/providers/search_screen_provider.dart';
import 'package:dummyShop/utils/constants/hive_constant.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(SearchHistoryAdapter());
  Hive.registerAdapter(ProductsVOAdapter());
  Hive.registerAdapter(DimensionsVOAdapter());
  Hive.registerAdapter(MetaVOAdapter());
  Hive.registerAdapter(ReviewsVOAdapter());

  await Hive.openBox<ProductsVO>(kBoxNameForProductVO);
  await Hive.openBox<ProductsVO>(kBoxNameForProductVODetail);
  await Hive.openBox<ProductsVO>(kBoxNameForAddToCart);
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>SearchScreenProvider(),),
        ChangeNotifierProvider(create: (_)=>CartProvider(),),
      ],
          child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationMenu(),
    );
  }
}
