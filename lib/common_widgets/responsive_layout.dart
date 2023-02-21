import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/responsive_web.dart';

/// A utility widget/ wrapper – able to rebuild based on size change.
/// Current version only support Web resizing, while other devices might not work.
/// For first use, it requires to execute [listenToSizeChanges] method from the [ResponsiveWebConfigs]
/// inside of initState of the highest level.
///
/// This widget follow the conventional app development, smallest screen to the largest screen
/// i.e. [child] is the default `ScreenType.mobile` and it will always be returned until it reaches
/// the next breakpoint [ScreenBreakpoint]. Note that, the next breakpoint is specified by the presence
/// of other optional paramenter [xs],[sm],[md],[lg] or [xl].
///
/// In case of wanting to hide the wiget on small screen (mobile etc), do not pass any argument for [child].
class ResponsiveLayout extends ConsumerWidget {
  const ResponsiveLayout({super.key, this.child, this.xs, this.sm, this.md, this.lg, this.xl})
      : assert(child != null || (xs != null || sm != null || md != null || lg != null || xl != null));

  /// The default size. Smallest size. if it's null -> an empty container will be returned.
  final Widget? child;

  /// width > 480
  final Widget? xs;

  /// width > 640
  final Widget? sm;

  /// width > 768
  final Widget? md;

  /// width > 1024
  final Widget? lg;

  /// width > 1536
  final Widget? xl;

  /// [ScreenType] order list with their widget from lowest to largest.
  List<ScreenTypeWithWidget> get hierarchy => [
        ScreenTypeWithWidget(screenType: ScreenType.mobile, widget: child ?? Container()),
        ScreenTypeWithWidget(screenType: ScreenType.xs, widget: xs),
        ScreenTypeWithWidget(screenType: ScreenType.sm, widget: sm),
        ScreenTypeWithWidget(screenType: ScreenType.md, widget: md),
        ScreenTypeWithWidget(screenType: ScreenType.lg, widget: lg),
        ScreenTypeWithWidget(screenType: ScreenType.xl, widget: xl),
      ];

  /// Get the supposed current widget based on the screen type.
  /// if the default [child] is null -> return a Container()
  /// While if there's no specified widget for a particular SceenType -> return the Predecessor widget.
  /// Also includes method to get the previous widget – only used when there is no widget for a particular screen type.
  Widget getWidgetToDisplay(ScreenType screenType) {
    // get the current index
    int index = hierarchy.indexWhere((element) => element.screenType == screenType);
    // itterate to get the current widget or the predecessor (if not present).
    for (var i = index; i >= 0; i--) {
      final Widget? widget = hierarchy[i].widget;
      if (widget != null) return widget;
    }
    return Container();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScreenType screenType = ref.watch(screenTypeProvider);
    // MAIN BODY
    return getWidgetToDisplay(screenType);
  }
}

/// A class to corelate [ScreenType] and its corresponding [Widget].
class ScreenTypeWithWidget {
  final ScreenType screenType;
  final Widget? widget;
  ScreenTypeWithWidget({required this.screenType, this.widget});
}
