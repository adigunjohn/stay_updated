import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/custom_widgets/su_button.dart';
import 'package:stay_updated/ui/screens/navigation/navigation_view.dart';

class PreHomeView extends StatelessWidget {
  const PreHomeView({super.key});
  static const String id = 'PreHomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PopScope(
      canPop: false,
      onPopInvoked: (val) {
        log('Can\'t pop screen -- $val');
      },
      child: SafeArea(
          child: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/svgs/news.svg',
              fit: BoxFit.cover,
              height: screenHeight(context),
              width: screenWidth(context),
            ),
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: SuButton(
                text: 'Stay Updated',
                buttonColor: Theme.of(context).cardColor,
                buttonTextColor: kCBlueColor,
                buttonWidth: screenWidth(context) / 1.2,
                radius: 30,
                onPressed: () {
                  locator<NavigationService>().pushNamed(NavigationView.id);
                },
                child: const Icon(
                  Icons.arrow_forward_outlined,
                  size: 32,
                  color: kCBlueColor,
                ),
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
