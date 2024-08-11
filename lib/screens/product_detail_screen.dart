import 'package:cached_network_image/cached_network_image.dart';
import 'package:dummyShop/data/vos/product_vo.dart';
import 'package:dummyShop/providers/product_details_provider.dart';
import 'package:dummyShop/screens/add_to_cart_screen.dart';
import 'package:dummyShop/utils/constants/colors.dart';
import 'package:dummyShop/utils/shimmers/detail_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.id,required this.productsVO});
  final int id;
  final ProductsVO productsVO;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductDetailProvider>(
      create: (_) => ProductDetailProvider(id),
      child: Consumer<ProductDetailProvider>(
        builder: (_, product, __) {
          return  Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  appBar(product, context),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.black,
                                    )
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star,color: Colors.amber,),
                                    const SizedBox(width: 5,),
                                    Text('${productsVO.rating}',style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.share),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: const Color(0xffffe16a),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text('${productsVO.discountPercentage}%',style: const TextStyle(
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                              const SizedBox(width: 20,),
                              Text('\$${productsVO.price}',style: const TextStyle(
                                decoration: TextDecoration.lineThrough
                              ),),
                              const SizedBox(width: 20,),
                             Text('\$${product.discountPrice(productsVO.price ?? 0.0, productsVO.discountPercentage ?? 0.0)}',style: const TextStyle(
                               color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          product.productDetails?.brand!=null?Row(
                            children: [
                              const Text('Brand : ',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text(productsVO.brand ?? ''),
                            ],
                          ):const SizedBox(), Row(
                            children: [
                              const Text('Status : ',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text(productsVO.availabilityStatus ?? ''),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Text(productsVO.title ?? '',style: const TextStyle(fontSize: 20),),
                          Text(productsVO.description ?? '',style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: AddToCartScreen(productsVO: product.productDetails ?? ProductsVO()),
          );
        },
      ),
    );
  }

  SliverAppBar appBar(ProductDetailProvider product, BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      automaticallyImplyLeading: false,
      backgroundColor: kGreyColor,
      flexibleSpace: FlexibleSpaceBar(
        background: SizedBox(
          height: 200,
          child: PageView.builder(
                controller: product.pageController,
                onPageChanged: (index){
                product.selectedIndex = index;
              },
              itemCount: product.productDetails?.images?.length,itemBuilder: (context,index){
            return Hero(
              tag: 'tag${product.productDetails?.images}',
              child: product.productDetails == null
                  ? const Center(
                    child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                  )
                  :CachedNetworkImage(
                imageUrl: '${product.productDetails?.images?[index]}',
                placeholder: (_,url)=>Image.asset('assets/images/images.png'),
                fit: BoxFit.cover,
              ),
            );
          }),
        )
      ),
      expandedHeight: 400,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: const BoxDecoration(
          ),
          child: Column(
            children: [
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    product.productDetails?.images?.length ?? 0,
                        (index) {
                      return  GestureDetector(
                        onTap: (){
                          product.pageController.jumpToPage(index);
                          product.selectedIndex = index;
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(5),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: product.currentIndex == index?2:0.5,
                                  color: product.currentIndex == index?const Color(0xff345edb):Colors.black,
                              )
                          ),
                          child: CachedNetworkImage(imageUrl: '${product.productDetails?.images?[index]}',
                            placeholder: (_,value)=>Image.asset('assets/images/images.png'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18,
            child: Icon(Icons.favorite_outline, color: Colors.black, size: 25),
          ),
        ),
      ],
      title: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.arrow_back_ios_new_outlined, size: 25),
        ),
      ),
    );
  }
}
