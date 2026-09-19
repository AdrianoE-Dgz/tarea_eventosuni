import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final Icon icon;
  final bool selected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: SizedBox(width: 80, child: Text(label),),
      avatar: icon,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(20))),
      selected: selected,
      onSelected: (_) {
        onTap();
      },
    );
  }
}
