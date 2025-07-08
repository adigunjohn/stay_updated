import 'package:flutter/material.dart';
import 'package:stay_updated/provider/app/locator.dart';
import 'package:stay_updated/provider/services/navigation_service.dart';
import 'package:stay_updated/provider/ui/common/styles.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stay_updated/provider/ui/screens/prehome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String id = 'SplashScreen';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      locator<NavigationService>().pushNamed(PreHomeView.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text('stay',
                    textScaler: TextScaler.noScaling,
                    style: kTSplashText),
                Text('Updated',
                    textScaler: TextScaler.noScaling,
                    style: kTSplashText.copyWith(color: kCBlueColor, fontSize: 38)),
                // const SizedBox(
                //   width: 5.0,
                // ),
                const Icon(
                  Icons.newspaper_rounded,
                  color: kCBlueColor,
                  size: 35.0,
                ),
              ],
             ).animate().scaleXY(duration: const Duration(milliseconds: 1000)),
          ],
        ),
      ),
    );
  }
}
