import 'package:coolab_me/repos/signin/signin_view.dart';
import 'package:flutter/material.dart';

/// The root of the application.
// TODO: Update the navigation logic here.
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return _TempPageDisplay.pages[0];
  }
}

/// Just for temporary place for pages.
class _TempPageDisplay {
  static final List<Widget> pages = [
    SigninView(),
  ];
}
