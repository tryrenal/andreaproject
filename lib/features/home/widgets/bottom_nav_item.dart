import 'package:andreaproject/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final bool isSelected;
  final void Function(int index) onSelected;

  const BottomNavItem({
    super.key,
    required this.index,
    required this.icon,
    required this.label,
    required this.onSelected,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 6 : 2,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppPallete.whiteColor : AppPallete.transparant,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _IconBottomNav(isSelected: isSelected, icon: icon),
            _LabelBottomNav(isSelected: isSelected, label: label),
          ],
        ),
      ),
    );
  }
}

class _LabelBottomNav extends StatelessWidget {
  const _LabelBottomNav({required this.isSelected, required this.label});

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedSize(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        alignment: Alignment.centerLeft,
        child: isSelected
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  label,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    color: AppPallete.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : SizedBox(width: 0),
      ),
    );
  }
}

class _IconBottomNav extends StatelessWidget {
  const _IconBottomNav({required this.isSelected, required this.icon});

  final bool isSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 45,
      width: 45,
      curve: Curves.easeOutCubic,
      alignment: Alignment.center,
      decoration: isSelected
          ? BoxDecoration(shape: BoxShape.circle, color: AppPallete.greenColor)
          : BoxDecoration(
              shape: BoxShape.circle,
              border: BoxBorder.all(width: 0.5, color: AppPallete.greyColor),
            ),
      child: Icon(
        icon,
        size: isSelected ? 24 : 16,
        color: isSelected ? AppPallete.blackColor : AppPallete.greyColor,
      ),
    );
  }
}
