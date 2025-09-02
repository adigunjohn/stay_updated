import 'package:flutter/material.dart';
import 'package:stay_updated/app/locator.dart';
import 'package:stay_updated/services/navigation_service.dart';
import 'package:stay_updated/ui/common/styles.dart';
import 'package:stay_updated/ui/common/ui_helpers.dart';

class SnackbarService {
  final NavigationService _navigationService = locator<NavigationService>();

  void showSnackbar({
    required String message,
    IconData? icon,
    Color? iconColor,
  }) {
    final context = _navigationService.navigatorKey.currentContext;
    if (context == null) return;

    final snackbar = SnackBar(
      backgroundColor: Theme.of(context).iconTheme.color,
      width: screenWidth(context)/1.5,
      content: Center(
        child: SizedBox(
            width: screenWidth(context)/2,
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: iconColor ?? kCBlueColor),
                const SizedBox(width: 8),
              ],
              Expanded(child: Text(message,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).cardColor, fontSize: 13),)),
            ],
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
