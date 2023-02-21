import 'package:coolab_me/repos/signup/signup_view.dart';
import 'package:coolab_me/routing/app_root.dart';
import 'package:coolab_me/routing/routes_name.dart';
import 'package:go_router/go_router.dart';

class RoutingConfigs {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const AppRoot(),
      ),
      GoRoute(path: RouteNames.signup, builder: (context, state) => SignupView()),
    ],
  );
}
