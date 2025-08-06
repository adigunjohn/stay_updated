import 'package:flutter/material.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';

class NavBarActiveItem extends StatelessWidget {
  const NavBarActiveItem({super.key, required this.text,required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 8),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: kCBlueColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: IconSize.bottomNavBarIcon,),
              const SizedBox(width: 3,),
              Text(text,style: kTBodyText1,),
            ],
          ),
        ),),
    );
  }
}
