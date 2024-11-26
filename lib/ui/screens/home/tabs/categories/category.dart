import 'package:flutter/material.dart';

import '../../../../model/category.dart';

class Category extends StatelessWidget {
  final CategoryDM categoryDM;
  const Category({super.key, required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    Radius radius = const Radius.circular(25);
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: categoryDM.backgroundColor,
            borderRadius: categoryDM.isLeftSided
                ? BorderRadius.only(
                    bottomRight: radius, topRight: radius, topLeft: radius)
                : BorderRadius.only(
                    bottomLeft: radius, topRight: radius, topLeft: radius)),
        child: Column(
          children: [
            Expanded(child: Image.asset(categoryDM.imagePath)),
            Text(
              categoryDM.name,
              style: theme.textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
