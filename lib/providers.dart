import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/router/app_router.dart';

final appRouterProvider = Provider<AppRouter>(
  (ref) => AppRouter(),
);
