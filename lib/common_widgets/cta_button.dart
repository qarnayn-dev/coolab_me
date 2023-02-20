// ignore_for_file: unnecessary_const

import 'package:coolab_me/configs/app_theme.dart';
import 'package:coolab_me/configs/shadow_theme.dart';
import 'package:flutter/material.dart';

/// A CTA button for general use cases.
/// For a secondary CTA button, pass [forSecondary] as `true`.
class CtaButton extends StatelessWidget {
  const CtaButton({
    super.key,
    required this.text,
    required this.onClick,
    this.forSecondary = false,
    this.isElevated = false,
    this.width,
    this.shadow,
  });

  final String text;
  final VoidCallback? onClick;
  final bool forSecondary;
  final bool isElevated;
  final double? width;
  final List<BoxShadow>? shadow;

  final EdgeInsets _padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
        boxShadow: (!forSecondary && isElevated) ? shadow ?? ShadowTheme.boxShadow : null,
      ),
      child: (forSecondary)
          ? OutlinedButton(
              onPressed: onClick,
              style: OutlinedButton.styleFrom(
                padding: _padding,
                primary: Colors.grey.shade400,
                textStyle: const TextStyle(fontWeight: FontWeight.w400),
              ),
              child: Text(text),
            )
          : TextButton(
              onPressed: onClick,
              style: TextButton.styleFrom(
                padding: _padding,
                backgroundColor: AppTheme.primary[100],
                primary: Colors.white,
                textStyle: const TextStyle(fontWeight: FontWeight.w400),
              ),
              child: Text(text),
            ),
    );
  }
}
