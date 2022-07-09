import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';
import '../theme/ahl_colors.dart';

class AppWidget extends ConsumerStatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Aholic',
      theme: ThemeData(
        fontFamily: 'Manrope',
        brightness: Brightness.light,
        // scaffoldBackgroundColor: Colors.white,
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //     primary: Colors.black,
        //     secondary: Colors.black,
        //     onBackground: const Color(0xFF8FA2AE)),
        // unselectedWidgetColor: const Color(0xFF8FA2AE),
        // disabledColor: const Color(0xFF8FA2AE),
        // splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: AhlColors.primary),
          bodyText1: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: AhlColors.primary),
        ),
      ),
      routerDelegate: appRouter.delegate(
          // initialDeepLink: widget.initialUri?.toString(),
          ),
      routeInformationParser: appRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
