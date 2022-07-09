import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/internationalisation/script_aware_yaml_asset_loader.dart';
import 'widgets/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize localization
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('zh', 'HK'),
          // Locale('zh', 'TW'),
          // Locale('zh', 'CN'),
          Locale.fromSubtags(
              languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'),
          // Locale.fromSubtags(
          //     languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
          // Locale.fromSubtags(
          //     languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: ScriptAwareYamlAssetLoader(),
        saveLocale: false,
        child: AppWidget(
            // initialUri: initialUri,
            ),
      ),
    ),
  );
}
