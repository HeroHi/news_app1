import 'package:flutter/material.dart';

import '../../../../utils/consts/app_colors.dart';


class CustomChoiceChip extends StatefulWidget {
  final String label;
  final bool selected;
  const CustomChoiceChip({super.key,required this.label,required this.selected});

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ChoiceChip(

          label: Text(widget.label),
          selected: widget.selected,
        showCheckmark: false,
        selectedColor: theme.primaryColor,

        labelStyle: widget.selected?theme.textTheme.displayMedium!.copyWith(color: AppColors.white):theme.textTheme.displayMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),side: BorderSide(color: theme.primaryColor)),
      ),
    );
  }
}
