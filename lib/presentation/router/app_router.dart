import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/sign_in_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(initial: true, page: SignInPage),
    // AutoRoute(initial: true, path: '/login', page: SignInPage),
  ],
)
class AppRouter extends _$AppRouter {}
