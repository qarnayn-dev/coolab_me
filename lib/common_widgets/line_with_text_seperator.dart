import 'package:coolab_me/configs/app_theme.dart';
import 'package:flutter/material.dart';

/// A widget that span over the width and display a fine line with [text] at the center.
class LineWithTextSeparator extends StatelessWidget {
  const LineWithTextSeparator({super.key, required this.text});
  final String text;

  double get width => text.length * 16 + 20;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 10,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: SizedBox(
            height: 20,
            width: width,
            child: Text(
              text,
              style: TextStyle(color: AppTheme.primary[600]),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
