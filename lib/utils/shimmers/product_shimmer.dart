import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerGrid extends StatelessWidget {
  const ProductShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 210,
        mainAxisSpacing: 15,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shimmer for image
              Container(
                width: double.infinity,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                height: 16.0,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 8.0),
              Container(
                width: 80.0,
                height: 16.0,
                color: Colors.grey[300],
              ),
            ],
          ),
        );
      },
    );
  }
}
