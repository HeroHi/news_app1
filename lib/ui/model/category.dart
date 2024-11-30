import 'package:easy_localization/easy_localization.dart';
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
    CategoryModel(name: tr("business"), imagePath: Assets.imagesBussines, backgroundColor: AppColors.businessOrange, isLeftSided: false, id: 'business'),
    CategoryModel(name: tr("health"), imagePath: Assets.imagesHealth, backgroundColor: AppColors.healthPink, isLeftSided: true, id: 'health'),
    CategoryModel(name: tr("sports"), imagePath: Assets.imagesBall, backgroundColor: AppColors.sportsRed, isLeftSided: false, id: 'sports'),
    CategoryModel(name: tr("science"), imagePath: Assets.imagesScience, backgroundColor: AppColors.scienceYellow, isLeftSided: true, id: 'science'),
    CategoryModel(name: tr("technology"), imagePath: Assets.imagesEnvironment, backgroundColor: AppColors.environmentGreen, isLeftSided: false, id: 'technology'),
    CategoryModel(name: tr("entertainment"), imagePath: Assets.imagesPolitics, backgroundColor: AppColors.politicsBlue, isLeftSided: true, id: 'technology'),

  ];
}