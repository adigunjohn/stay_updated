import 'package:flutter/material.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.icon, this.onTap, this.color, this.iconColor});
  final void Function()? onTap;
  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? kCGreyColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Icon(icon, size: IconSize.menuButtonIcon, color: iconColor ?? Colors.black,),
        ),
      ),
    );
  }
}
