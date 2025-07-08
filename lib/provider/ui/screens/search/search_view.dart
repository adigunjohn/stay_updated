import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
 static const String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Search Screen'),
        ),
      ),
    );
  }
}
