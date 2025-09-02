import 'package:flutter/material.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';

class SuButton extends StatelessWidget {
  const SuButton({super.key,this.style, this.onPressed,this.buttonWidth, this.buttonHeight, this.child, this.buttonColor,this.radius, this.text, this.elevation, this.buttonTextColor});
  final void Function()? onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? elevation;
  final double? radius;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Widget? child;
  final String? text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: buttonWidth ?? screenWidth(context),
      height: buttonHeight ?? 55,
      color: buttonColor ?? kCBlueColor,
      elevation: elevation ?? 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 20)),
      child: child ?? Center(child: Text(text.toString(), style: style ?? kTButtonText.copyWith(color: buttonTextColor),)),
    );
  }
}
