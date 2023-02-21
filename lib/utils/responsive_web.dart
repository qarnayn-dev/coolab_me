import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Enum for the type of window (only for web) screen size width.
/// It uses [ScreenBreakpoint] as the breakpoints.
/// The [mobile] is when `width < ScreenBreakpoint().xs`
enum ScreenType {
  mobile,
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Screen width breakpoints.
/// `xs = 480`, `sm = 640`, `md = 768`, `lg = 1024`, `xl = 1536`.
class ScreenBreakpoint {
  final double xs = 480;
  final double sm = 640;
  final double md = 768;
  final double lg = 1024;
  final double xl = 1536;
}

/// Configuration for setting up a [ResponsiveLayout] throughout the app.
/// Best practice is to call the [listenToSizeChanges] method inside of the `initState` on the highest level.
/// And call the [removeListener] inside of the `dispose` method on the same level.
class ResponsiveWebConfigs {
  final ScreenBreakpoint _breakpoint = ScreenBreakpoint();

  /// Initiate a listener for the layout changes
  void listenToSizeChanges(BuildContext context, WidgetRef ref) {
    _updateScreenSNProvider(context, ref); // update once the app fully started
    window.addEventListener("resize", (event) {
      event.preventDefault();
      _updateScreenSNProvider(context, ref);
    });
  }

  /// remove the [listenToSizeChanges] that has been established.
  /// use this in the `dispose` method.
  void removeListener() {
    window.removeEventListener("resize", (event) => null);
  }

  /// update the state for the screen state notifier.
  /// Automatically update the [windowSizeSNProvider]
  /// Note for [screenTypeSNProvider], its state only changes once the condition satisfied as in the Notifier method.
  void _updateScreenSNProvider(BuildContext context, WidgetRef ref) {
    // This method wait all frame rendering to be completed, the execute the callback.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Size screenSize = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
      ref.read(windowSizeSNProvider.notifier).onWindowSizeChanges(screenSize);
    });
  }

  /// A method to determine the sceen type
  ScreenType getScreenType({double? screenWidth, BuildContext? context}) {
    assert(screenWidth != null || context != null);
    final double windowWidth = screenWidth ?? MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

    if (windowWidth > _breakpoint.xl) {
      return ScreenType.xl;
    } else if (windowWidth > _breakpoint.lg && windowWidth <= _breakpoint.xl) {
      return ScreenType.lg;
    } else if (windowWidth > _breakpoint.md && windowWidth <= _breakpoint.lg) {
      return ScreenType.md;
    } else if (windowWidth > _breakpoint.sm && windowWidth <= _breakpoint.md) {
      return ScreenType.sm;
    } else if (windowWidth > _breakpoint.xs && windowWidth <= _breakpoint.sm) {
      return ScreenType.xs;
    } else {
      return ScreenType.mobile;
    }
  }
}

/// Expose the current Screen type state based on the [ScreenBreakpoint].
final screenTypeProvider = Provider<ScreenType>((ref) {
  final width = ref.watch(windowSizeSNProvider.select((value) => value.width));
  return ResponsiveWebConfigs().getScreenType(screenWidth: width);
});

/// Provide the size of the screen window.
final windowSizeSNProvider = StateNotifierProvider<_WindowSizeSNotifier, Size>((ref) {
  return _WindowSizeSNotifier();
});

class _WindowSizeSNotifier extends StateNotifier<Size> {
  _WindowSizeSNotifier() : super(MediaQueryData.fromWindow(WidgetsBinding.instance.window).size);

  /// Update the window size accordingly.
  void onWindowSizeChanges(Size newSize) {
    state = newSize;
  }
}
