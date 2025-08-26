import 'package:get_it/get_it.dart';
import 'package:stay_updated/app/theme.dart';
import 'package:stay_updated/services/hive_service.dart';
import 'package:stay_updated/services/http_service.dart';
import 'package:stay_updated/services/navigation_service.dart';

GetIt locator = GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AppTheme());
  locator.registerLazySingleton(() => HttpService());
  locator.registerLazySingleton(() => HiveService());
}
