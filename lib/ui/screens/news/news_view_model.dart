import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewModel extends ChangeNotifier{

  Future<void> launchInBrowserView(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

}