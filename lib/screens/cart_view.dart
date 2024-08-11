import 'package:cached_network_image/cached_network_image.dart';
import 'package:dummyShop/screens/home_screen.dart';
import 'package:dummyShop/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (_,provider,__)=>Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black)
            ],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15) ),
          ),
          height: 250,
          child: ListView(
            children: [
              HorizontalTitleWidget(
                title: 'Product Price',
                subtitle: '${provider.totalPrice().toStringAsFixed(2)}\$',
              ),const HorizontalTitleWidget(
                title: 'Tax Fees',
                subtitle: 'No Fee',
              ),HorizontalTitleWidget(
                title: 'SubTotal',
                subtitle: '${provider.totalPrice().toStringAsFixed(2)}\$',
              ),

              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: const Text('Proceed to checkout',style:TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),),
              ),
            ],
          ),
        ),
      ),
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
                      color: Colors.white,
                      child: Container(
                        height: 110,
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:Colors.grey.withOpacity(0.2),
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
                          child:Image.asset('assets/images/delete1.png',width: 20,height: 20,))),
                  Positioned(
                    bottom: 23,
                      right: 25,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                            width: 2
                          )
                        ),
                        child:Row(
                          children: [
                            InkWell(
                              onTap: (){
                                cartProvider.decreaseQuantity(product.id ?? 1);
                              },
                                child: const Icon(Icons.remove,)),
                            const SizedBox(width: 5,),
                            Text('${product.quantity}',style: const TextStyle(
                              color: kPrimaryColor
                            ),),
                            const SizedBox(width: 5,),
                            InkWell(
                              onTap: (){
                                cartProvider.increaseQuantity(product.id ?? 1);
                              },
                                child: const Icon(Icons.add)),
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
