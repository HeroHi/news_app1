import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../utils/consts/app_colors.dart';


class CategoryModel{
  String name;
  String imagePath;
  Color backgroundColor;
  bool isLeftSided;
  String id;
  CategoryModel({required this.id,required this.name,required this.imagePath,required this.backgroundColor,required this.isLeftSided});
  static List<CategoryModel> categoriesList = [
    CategoryModel(name: "Business", imagePath: Assets.imagesBussines, backgroundColor: AppColors.businessOrange, isLeftSided: false, id: 'business'),
    CategoryModel(name: "Health", imagePath: Assets.imagesHealth, backgroundColor: AppColors.healthPink, isLeftSided: true, id: 'health'),
    CategoryModel(name: "Sports", imagePath: Assets.imagesBall, backgroundColor: AppColors.sportsRed, isLeftSided: false, id: 'sports'),
    CategoryModel(name: "Science", imagePath: Assets.imagesScience, backgroundColor: AppColors.scienceYellow, isLeftSided: true, id: 'science'),
    CategoryModel(name: "Technology", imagePath: Assets.imagesEnvironment, backgroundColor: AppColors.environmentGreen, isLeftSided: false, id: 'technology'),
    CategoryModel(name: "Entertainment", imagePath: Assets.imagesPolitics, backgroundColor: AppColors.politicsBlue, isLeftSided: true, id: 'technology'),

  ];
}