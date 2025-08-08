import 'package:flutter/material.dart';

import '../common/styles.dart';

class SelectThemeWidget extends StatelessWidget {
  const SelectThemeWidget({super.key, required this.selectedTheme, required this.text, required this.onTap});

  final String text;
  final bool selectedTheme;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kCGreyColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(style: BorderStyle.solid, width: 4, color: selectedTheme == true ? kCBlueColor : Colors.transparent,),
          ),
          child: Center(child: Text(text, style: kTSubtitleText.copyWith(color: Colors.black),),),
        ),
      ),
    );
  }
}
