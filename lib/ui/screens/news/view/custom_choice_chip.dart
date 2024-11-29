import 'package:flutter/material.dart';

import '../../../../utils/consts/app_colors.dart';

class CustomChoiceChip extends StatefulWidget {
  final String label;
  bool isSelected;
  final Function() onSelected;
   CustomChoiceChip({super.key,required this.label,required this.onSelected,required this.isSelected});

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
          onSelected: (value) {
            widget.isSelected = !widget.isSelected;
            widget.onSelected();
            setState(() {});
          },
          label: Text(widget.label),
          selected: widget.isSelected,
        showCheckmark: false,
        selectedColor: theme.primaryColor,

        labelStyle: widget.isSelected?theme.textTheme.displaySmall!.copyWith(color: AppColors.white):theme.textTheme.displaySmall,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),side: BorderSide(color: theme.primaryColor)),
      ),
    );
  }
}
