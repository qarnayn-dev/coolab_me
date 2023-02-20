import 'package:flutter/material.dart';

/// A utitlity widget for hover effect.
class HoverEffect<T> extends StatefulWidget {
  const HoverEffect({
    super.key,
    required this.builder,
    required this.defaultValue,
    required this.onHoverValue,
  });
  final T? defaultValue;
  final T onHoverValue;
  final Widget Function(BuildContext context, T? value) builder;

  @override
  State<HoverEffect<T>> createState() => _HoverEffectState<T>();
}

class _HoverEffectState<T> extends State<HoverEffect<T>> {
  late bool isHovered;

  void onEntered(bool isEntering) => setState(() {
        print("Heeee");
        isHovered = isEntering;
      });

  @override
  void initState() {
    super.initState();
    isHovered = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (point) => onEntered(true),
      onExit: (point) => onEntered(false),
      child: widget.builder(context, isHovered ? widget.onHoverValue : widget.defaultValue),
    );
  }
}
