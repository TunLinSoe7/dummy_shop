import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailShimmer extends StatelessWidget {
  const DetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(child: Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.grey,
        ),
      ],
    ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100);
  }
}
