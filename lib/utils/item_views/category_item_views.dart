import 'package:flutter/material.dart';


class CategoryItemView extends StatelessWidget {
  const CategoryItemView({
    super.key,
    required this.category,
    required this.isSelected,required this.index, required this.onTap,
  });

  final String category;
  final bool isSelected;
  final int index;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected?const Color(0xff19c463):Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          category,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}