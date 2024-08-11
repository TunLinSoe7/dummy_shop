import 'package:dummyShop/utils/item_views/product_item_views.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SmartPhones'),
        ),
        body: Column(
          children: [
            Expanded(child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 210,
                    crossAxisCount: 2),
                itemBuilder: (_,index){
                  return ProductItemViews(imageUrl: '', title: "Apple", rating: '3.4', price: '88', onTap: (){}, onPressed: () {  },);
                }))
          ],
        )
    );
  }
}
