import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dummyShop/data/vos/promo_vo.dart';
import 'package:dummyShop/providers/home_screen_provider.dart';
import 'package:dummyShop/screens/all_categories_screen.dart';
import 'package:dummyShop/screens/cart_view.dart';
import 'package:dummyShop/screens/search_screen.dart';
import 'package:dummyShop/utils/constants/colors.dart';
import 'package:dummyShop/utils/helper_functions/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../data/vos/product_vo.dart';
import '../widgets/home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>HomeScreenProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          title: const Text('Discover'),
          actions: [
            badges.Badge(
              badgeContent: const Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              position: badges.BadgePosition.topEnd(top: -5, end: 10),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Color(0xff19c463),
              ),
              child: GestureDetector(
                onTap: (){
                  HelperFunctions.navigateToScreen(const CartView(), context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset('assets/images/bag.png', width: 20, height: 20),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
              /// search widget
              SearchWidget(onTap: (){
                HelperFunctions.navigateToScreen(const SearchScreen(), context);
              },),
              /// promo slider
              const PromoSlider(),
              /// horizontal title
              HorizontalTitleWidget(title: 'Categories',subtitle: 'See All',onTap: (){
                HelperFunctions.navigateToScreen(const AllCategoriesScreen(), context);
              },),
              /// categories list
              const CategoryWidget(),
              const SizedBox(height: 20),
              /// products
              const ProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}



class HorizontalTitleWidget extends StatelessWidget {
  const HorizontalTitleWidget({
    super.key, required this.title, required this.subtitle, this.onTap,
  });
  final String title;
  final GestureTapCallback? onTap;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: Text(
           subtitle,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<HomeScreenProvider,List<PromoVO>?>(builder: (_,value,__){
      return SizedBox(
        child: CarouselSlider.builder(itemCount: value?.length, itemBuilder: (_,index,realIndex){
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: value==null || value.isEmpty?const Center(
              child: CircularProgressIndicator(),
            ):ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: Image.asset('${value[index].image}',fit: BoxFit.fill,)),
          );
        }, options: CarouselOptions(
          autoPlay: true,
         enlargeCenterPage: true
        )),
      );
    }, selector: (_,provider)=>provider.products );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key, required this.onTap,
  });
final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xfff1f3f2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Text('Search'),
          Spacer(),
          Icon(Icons.search),
        ],
      ),
              ),
    );
  }
}




