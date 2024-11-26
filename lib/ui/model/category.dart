import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../utils/app_colors.dart';


class CategoryDM{
  String name;
  String imagePath;
  Color backgroundColor;
  bool isLeftSided;
  CategoryDM({required this.name,required this.imagePath,required this.backgroundColor,required this.isLeftSided});
  static List<CategoryDM> categoriesList = [
    CategoryDM(name: "Business", imagePath: Assets.imagesBussines, backgroundColor: AppColors.businessOrange, isLeftSided: false),
    CategoryDM(name: "Health", imagePath: Assets.imagesHealth, backgroundColor: AppColors.healthPink, isLeftSided: true),
    CategoryDM(name: "Sports", imagePath: Assets.imagesBall, backgroundColor: AppColors.sportsRed, isLeftSided: false),
    CategoryDM(name: "Science", imagePath: Assets.imagesScience, backgroundColor: AppColors.scienceYellow, isLeftSided: true),
    CategoryDM(name: "Technology", imagePath: Assets.imagesEnvironment, backgroundColor: AppColors.environmentGreen, isLeftSided: false),
    CategoryDM(name: "Entertainment", imagePath: Assets.imagesPolitics, backgroundColor: AppColors.politicsBlue, isLeftSided: true),

  ];
}