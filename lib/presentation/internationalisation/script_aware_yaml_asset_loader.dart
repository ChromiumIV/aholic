import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class ScriptAwareYamlAssetLoader extends AssetLoader {
  String getLocalePath(String basePath, Locale locale) {
    debugPrint('Locale: $locale');

    return '$basePath/${locale.languageCode + ((locale.countryCode != null) ? "-${locale.countryCode!}" : "")}.yaml';
    //return '$basePath/${localeToString(locale, separator: "-")}.yaml';
  }

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    var localePath = getLocalePath(path, locale);
    YamlMap yaml = loadYaml(await rootBundle.loadString(localePath));
    return convertYamlMapToMap(yaml);
  }
}

/// Convert YamlMap to Map
Map<String, dynamic> convertYamlMapToMap(YamlMap yamlMap) {
  final map = <String, dynamic>{};

  for (final entry in yamlMap.entries) {
    if (entry.value is YamlMap || entry.value is Map) {
      map[entry.key.toString()] = convertYamlMapToMap(entry.value);
    } else {
      map[entry.key.toString()] = entry.value.toString();
    }
  }
  return map;
}
