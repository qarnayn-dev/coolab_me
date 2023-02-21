import 'package:coolab_me/common_widgets/responsive_layout.dart';
import 'package:coolab_me/configs/app_theme.dart';
import 'package:coolab_me/configs/shadow_theme.dart';
import 'package:flutter/material.dart';

/// A frame/ wrapper for any onboard page.
class OnboardFrame extends StatelessWidget {
  const OnboardFrame({super.key, required this.child, this.alignment});
  final Widget child;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      md: _largeScreen(alignment: alignment, child: child),
      child: _MobileScreen(alignment: alignment, child: child),
    );
  }
}

class _MobileScreen extends StatelessWidget {
  const _MobileScreen({super.key, required this.child, this.alignment});
  final Widget child;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 56),
        margin: const EdgeInsets.only(top: 96),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          child: Column(
            children: [
              Material(
                elevation: 10,
                shadowColor: ShadowTheme.colorBase,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Container(
                  width: double.maxFinite,
                  alignment: alignment ?? Alignment.topCenter,
                  height: 500,
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 20),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _largeScreen extends StatelessWidget {
  const _largeScreen({super.key, required this.child, this.alignment});
  final Widget child;
  final Alignment? alignment;

  final Radius _radius = const Radius.circular(16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.only(topRight: _radius, bottomRight: _radius),
              ),
              child:
                  // TODO: marketing here
                  Center(
                child: Text("Put some marketing here"),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              width: double.maxFinite,
              alignment: alignment,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
