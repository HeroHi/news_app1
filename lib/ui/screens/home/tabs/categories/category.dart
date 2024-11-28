import 'package:flutter/material.dart';

import '../../../../model/category.dart';

class Category extends StatelessWidget {
  final CategoryModel categoryModel;
  const Category({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    Radius radius = const Radius.circular(25);
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: categoryModel.isLeftSided
              ? BorderRadius.only(
                  bottomRight: radius, topRight: radius, topLeft: radius)
              : BorderRadius.only(
                  bottomLeft: radius, topRight: radius, topLeft: radius)),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryModel.imagePath)),
          Text(
            categoryModel.name,
            style: theme.textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
