import 'package:coolab_me/utils/responsive_web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:coolab_me/configs/app_theme.dart';
import 'package:coolab_me/routing/routing_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final GoRouter router;
  late final ResponsiveWebConfigs webConfig;

  @override
  void initState() {
    super.initState();
    router = RoutingConfigs().router;
    webConfig = ResponsiveWebConfigs();
    // For web, listen to the 'resizing' changes.
    if (kIsWeb) webConfig.listenToSizeChanges(context, ref);
  }

  @override
  void dispose() {
    webConfig.removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'coolab_me',
      theme: AppTheme.themeData,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
