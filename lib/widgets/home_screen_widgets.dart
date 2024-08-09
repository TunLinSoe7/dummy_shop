import 'package:dummyShop/screens/product_detail_screen.dart';
import 'package:dummyShop/utils/helper_functions/helpers_functions.dart';
import 'package:dummyShop/utils/item_views/product_item_views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home_screen_provider.dart';
import '../utils/item_views/category_item_views.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (_,provider,__){
      return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: provider.categories.length,
          itemBuilder: (_, index) {
            final category = provider.categories[index];
            bool isSelected = provider.selectedIndex == index;
            return Align(
              alignment: Alignment.center,
              child: CategoryItemView(index: index,category: category.name ?? '' , isSelected: isSelected,onTap: () {
                  provider.setSelectedCategory(index);
              },),
            );
          },
        ),
      );
    });
  }
}

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (_, product, __) {
        // Show loading indicator if productsByCategory is null or empty
        if (product.productsByCategory == null || product.productsByCategory!.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // Otherwise, show the GridView
        return GridView.builder(
          itemCount: product.productsByCategory!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 210,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
          ),
          itemBuilder: (_, index) => ProductItemViews(
            tag: 'tag$index',
            imageUrl: product.productsByCategory?[index].thumbnail ?? '',
            title: product.productsByCategory?[index].title ?? '',
            rating: product.productsByCategory?[index].rating.toString() ?? '',
            price: product.productsByCategory?[index].price.toString() ?? '',
            onTap: () {
              HelperFunctions.navigateToScreen(
                ProductDetailScreen(id: product.productsByCategory?[index].id ?? 1),
                context,
              );
            },
          ),
        );
      },
    );
  }
}

