import 'package:flutter/material.dart';

import '../../../../utils/consts/app_colors.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onSelected;
   CustomChoiceChip({super.key,required this.label,required this.onSelected,required this.isSelected});
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ChoiceChip(
          onSelected: (value) {
            onSelected();
          },
          label: Text(label),
          selected:isSelected,
        showCheckmark: false,
        selectedColor: theme.primaryColor,
        labelStyle: isSelected?theme.textTheme.displaySmall!.copyWith(color: AppColors.white):theme.textTheme.displaySmall,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),side: BorderSide(color: theme.primaryColor)),
      ),
    );
  }
}
