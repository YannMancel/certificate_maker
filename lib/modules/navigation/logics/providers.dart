import 'package:certificate_maker/_features.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;

final _navigationLogicRef = Provider<NavigationLogicInterface>(
  (_) => const NavigationLogic(),
  name: NavigationLogicInterface.kName,
);

final routerRef = Provider<GoRouter>(
  (ref) {
    final logic = ref.watch(_navigationLogicRef);
    return logic.router;
  },
  name: 'routerRef',
);
