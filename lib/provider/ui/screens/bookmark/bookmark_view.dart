import 'package:flutter/material.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({super.key});
  static const String id = 'BookmarkView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Bookmark Screen'),
        ),
      ),
    );
  }
}
