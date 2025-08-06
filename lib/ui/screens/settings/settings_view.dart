import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const String id = 'SettingsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: screenHeight(context),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      locator<NavigationService>().pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: IconSize.menuButtonIcon,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Settings',
                    style: kTBigText,
                  ),
                  // SizedBox(
                  //   height: MediaQuery.sizeOf(context).height * 0.025,
                  // ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    'Account',
                    style: kTBoldSubtitleText.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person, color: kCNormalGreyColor,),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Profile',
                              style: kTSubtitleText.copyWith(
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded, color: kCNormalGreyColor, size: 21,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.exit_to_app_rounded, color: kCNormalGreyColor,),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Exit app',
                              style: kTSubtitleText.copyWith(
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded, color: kCNormalGreyColor, size: 21,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'App Settings',
                    style: kTBoldSubtitleText.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                        print('Show pop up for theme selection');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Text(
                                'Toggle theme',
                                style: kTSubtitleText.copyWith(
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Dark mode activated',
                                style: kTSubtitleText.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded, color: kCNormalGreyColor, size: 21,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      print('Show pop up for theme selection');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Push notifications',
                          style: kTSubtitleText.copyWith(
                              fontWeight: FontWeight.normal),
                        ),
                        // const Icon(Icons.arrow_forward_ios_rounded),
                        Transform.scale(
                          scale: 0.75,
                          child: CupertinoSwitch(
                              value: false,
                              activeColor: kCBlueColor,
                              onChanged: (value) {}),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
