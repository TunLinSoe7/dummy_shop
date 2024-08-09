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
        height: kBottomNavigationBarHeight,
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
                provider.decrease(productsVO);
              },
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.remove,color: Colors.white,),
              ),
            ),
            const SizedBox(width: 15,),
            Text('${productsVO.quantity ?? 1}',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),),
            const SizedBox(width: 15,),
            GestureDetector(
              onTap: (){
                provider.increase(productsVO);
              },
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.add,color: Colors.white,),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                provider.saveToCart(productsVO);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black
                ),
                child: const Text('Add to Cart',style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ],
        ),
      );
    });
  }
}
