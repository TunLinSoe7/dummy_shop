import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductItemViews extends StatelessWidget {
  const ProductItemViews({
    super.key, required this.imageUrl, required this.title, required this.rating, required this.price,
  });
  final String imageUrl;
  final String title;
  final String rating;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 160,
            height: 150,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xfff1f3f2),
            ),
            child: CachedNetworkImage(imageUrl: imageUrl)
        ),
        SizedBox(
          width: 150,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(rating),
            ],
          ),
        ),
        SizedBox(
          width: 150,
          child:Text(
              '\$ $price',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis
              ),
            ),
        ),
      ],
    );
  }
}