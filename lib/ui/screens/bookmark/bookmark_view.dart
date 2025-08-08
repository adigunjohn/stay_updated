import 'package:flutter/material.dart';
import 'package:stay_updated/ui/common/styles.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({super.key});
  static const String id = 'BookmarkView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Your bookmarked news articles will appear here [ coming soon ]', style: kTSubtitleText,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
