import 'package:cached_network_image/cached_network_image.dart';
import 'package:dummyShop/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final cartItems = cartProvider.cartItems;
          if (cartItems == null || cartItems.isEmpty) {
            return const Center(child: Text('No items in the cart'));
          }

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final product = cartItems[index];
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: Container(
                        height: 110,
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              width: 100,
                                height: 110,
                                child: CachedNetworkImage(imageUrl: '${product.thumbnail}',width: 100,height: 120,)),
                            const SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text('${product.title}',style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                ),
                                Text('${product.price}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 23,
                      right: 25,
                      child: InkWell(
                        onTap: (){
                          cartProvider.removeFromCart(product.id ?? 0);
                        },
                          child:const Icon(Icons.delete_outline_outlined,color: Colors.red,))),
                  Positioned(
                    bottom: 23,
                      right: 25,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child:Row(
                          children: [
                            InkWell(
                              onTap: (){
                                cartProvider.decreaseQuantity(product.id ?? 0);
                              },
                                child: Icon(Icons.remove,)),
                            SizedBox(width: 5,),
                            Text('${product.quantity}'),
                            SizedBox(width: 5,),
                            Icon(Icons.add),
                          ],
                        ) ,
                      )),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
