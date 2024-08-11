import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key, required this.productsVO});
  final ProductsVO productsVO;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (_,provider,__){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(bottom: 10),
        height: kBottomNavigationBarHeight,
        child: GestureDetector(
          onTap: (){
            provider.saveToCart(productsVO);
          },
          child: Container(
            width: MediaQuery.of(context).size.width /1.2,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black
            ),
            child: const Center(
              child: Text('Add to Cart',style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
      );
    });
  }
}
