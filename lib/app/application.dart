import 'package:flutter/material.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/hive_service.dart';
import 'package:stay_updated/ui/common/strings.dart';


class Application {
  static const String appName = AppStrings.stayUpdated;

  static void initializeApp() async{
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    await HiveService.initializeHive();
  }
}

