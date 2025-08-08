
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';
import 'package:stay_updated/ui/custom_widgets/select_theme_widget.dart';
import 'package:stay_updated/ui/screens/profile/profile_view.dart';
import 'package:stay_updated/ui/screens/settings/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const String id = 'SettingsView';

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsViewModel>(
      builder: (context,model,child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              height: screenHeight(context),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          locator<NavigationService>().pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).iconTheme.color,
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
                        onTap: () {
                          locator<NavigationService>().pushNamed(ProfileView.id);
                        },
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
                             showDialog(
                                context: context,
                                // barrierDismissible: false,
                                builder: (BuildContext dialogContext) {
                                  return Consumer<SettingsViewModel>(
                                    builder: (context, dialogModel, child) {
                                      return AlertDialog(
                                        title: Text('Select Theme', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SelectThemeWidget(
                                                text: AppThemeMode.automatic.name,
                                                selectedTheme: model.isAutomaticTheme,
                                                onTap: (){
                                                  model.updateThemeMode(AppThemeMode.automatic);
                                                },
                                              ),
                                              SelectThemeWidget(
                                                text: AppThemeMode.light.name,
                                                selectedTheme: model.isLightTheme,
                                                onTap: (){
                                                  model.updateThemeMode(AppThemeMode.light);
                                                },
                                              ),
                                              SelectThemeWidget(selectedTheme: model.isDarkTheme,
                                                text: AppThemeMode.dark.name,
                                                onTap: (){
                                                model.updateThemeMode(AppThemeMode.dark);
                                                },),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Dismiss the dialog
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                  );
                                },
                              );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    model.themeMessages[model.themeMessageIndex],
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
                        onTap: () {},
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
    );
  }
}

