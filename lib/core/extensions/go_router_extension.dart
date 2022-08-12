import 'package:certificate_maker/_features.dart';
import 'package:go_router/go_router.dart' show GoRouter;

extension GoRouterExt on GoRouter {
  bool get isPreview {
    return location == '${RouteNames.kRoot}${RouteNames.kPreview}';
  }
}
