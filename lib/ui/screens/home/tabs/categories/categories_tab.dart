import 'package:flutter/material.dart';

import '../../../../model/category.dart';
import 'category.dart';
class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pick your category \n of interest",style: theme.textTheme.titleLarge,),
          const SizedBox(height: 30,),
          _buildGridView(),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return Expanded(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 20,childAspectRatio: 0.9),
            itemCount: 6,
            itemBuilder: (context, index) =>  Category(categoryDM: CategoryDM.categoriesList[index],),
          ),
        );
  }

}