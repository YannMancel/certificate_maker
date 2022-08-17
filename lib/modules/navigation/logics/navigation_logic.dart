import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'
    show CustomTransitionPage, GoRoute, GoRouter, UrlPathStrategy;

typedef RouteBuilder = Widget Function(Object? extra);

abstract class NavigationLogicInterface {
  static String get kName => 'NavigationLogicInterface';
  GoRouter get router;
}

class NavigationLogic implements NavigationLogicInterface {
  const NavigationLogic();

  GoRoute _getRoute({
    String? name,
    required String path,
    required RouteBuilder builder,
    List<GoRoute> subRoutes = const <GoRoute>[],
  }) {
    return GoRoute(
      name: name,
      path: path,
      pageBuilder: (_, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        transitionsBuilder: Transitions.fadeTransitionsBuilder,
        child: AdaptiveView(
          child: builder(state.extra),
        ),
      ),
      routes: subRoutes,
    );
  }

  @override
  GoRouter get router {
    return GoRouter(
      urlPathStrategy: UrlPathStrategy.path,
      routes: <GoRoute>[
        _getRoute(
          path: RouteNames.kRoot,
          builder: (_) => const HomeView(),
          subRoutes: <GoRoute>[
            _getRoute(
              name: RouteNames.kPreview,
              path: RouteNames.kPreview,
              builder: (_) => const PreviewView(),
            ),
          ],
        ),
      ],
      errorPageBuilder: (_, state) => MaterialPage(
        key: state.pageKey,
        child: const Material(
          child: ErrorView(),
        ),
      ),
    );
  }
}
