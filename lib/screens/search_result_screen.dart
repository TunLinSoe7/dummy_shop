import 'package:dummyShop/providers/search_screen_provider.dart';
import 'package:dummyShop/screens/product_detail_screen.dart';
import 'package:dummyShop/utils/helper_functions/helpers_functions.dart';
import 'package:dummyShop/utils/item_views/product_item_views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.searchText});
  final String searchText;

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchScreenProvider>(
      builder: (_, provider, __) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: const Icon(Icons.arrow_back_ios),
            title: Text(
              searchText,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Found',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${provider.search?.length ?? 0} Results',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Row(
                        children: [
                          Text('Filter'),
                          SizedBox(width: 5),
                          Icon(Icons.expand_circle_down_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                provider.search != null && provider.search!.isNotEmpty
                    ? Expanded(
                  child: GridView.builder(
                    itemCount: provider.search!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 210,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (_, index) {
                      return ProductItemViews(
                        imageUrl: '${provider.search?[index].thumbnail}',
                        title: '${provider.search?[index].title?.toLowerCase()}',
                        rating: '${provider.search?[index].rating}',
                        price: '${provider.search?[index].price}',
                        onTap: () {
                          HelperFunctions.navigateToScreen(
                            ProductDetailScreen(id: provider.search?[index].id ?? 101),
                            context,
                          );
                        },
                      );
                    },
                  ),
                )
                    : const Center(child: Text('No Product Found!')),
              ],
            ),
          ),
        );
      },
    );
  }
}
