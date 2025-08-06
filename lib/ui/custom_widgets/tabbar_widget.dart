import 'package:flutter/material.dart';
import 'package:stay_updated/ui/common/styles.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(
      {super.key,
        required this.tabText,
        required this.onTap,
        required this.isCurrentIndex});
  final String tabText;
  final void Function()? onTap;
  final bool isCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: isCurrentIndex
            ? BoxDecoration(
          borderRadius: BorderRadius.circular(73),
          color: kCBlueColor,
        )
            : BoxDecoration(
          color: kCGreyColor,
          borderRadius: BorderRadius.circular(73),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, top: 1.0, bottom: 1.0),
          child: Center(
            child: Text(
              tabText,
              style: isCurrentIndex ? kTBodyText1.copyWith(fontSize: 15) : kTBodyText1.copyWith(fontSize: 15, color: kCNormalGreyColor),
            ),
          ),
        ),
      ),
    );
  }
}