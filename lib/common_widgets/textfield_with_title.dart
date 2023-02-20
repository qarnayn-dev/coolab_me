import 'package:coolab_me/configs/app_theme.dart';
import 'package:flutter/material.dart';

/// A textfield with title at the top left.
class TextfieldWithTitle extends StatelessWidget {
  const TextfieldWithTitle({
    super.key,
    required this.title,
    required this.onChange,
    this.hint,
    this.iconData,
    this.obscureText = false,
    this.titleIndent,
  });
  final String title;
  final String? hint;
  final IconData? iconData;
  final bool obscureText;
  final double? titleIndent;
  final void Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: titleIndent ?? 0),
            child: Text(title, style: AppTheme.secondaryStyle),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 32,
            child: TextField(
              onChanged: onChange,
              obscureText: obscureText,
              decoration: InputDecoration(
                  hintText: hint,
                  prefixIcon: (iconData != null)
                      ? SizedBox(
                          width: 16,
                          child: Icon(
                            iconData,
                            size: 14,
                          ),
                        )
                      : null),
            ),
          ),
        ],
      ),
    );
  }
}
