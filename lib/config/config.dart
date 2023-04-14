import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_config/flutter_config.dart';
import 'package:yaml/yaml.dart';

bool isAndroid = Platform.isAndroid;
bool isIOS = Platform.isIOS;

class Config {
  String apiHost;
  String origin;

  Config({
    required this.apiHost,
    required this.origin,
  });

  factory Config.newConfig(Map c) {
    String apiHost = "";
    if (isIOS) {
      apiHost = c['ios_local_host'];
    }
    if (isAndroid) {
      apiHost = c['android_local_host'];
    }

    return Config(
      apiHost: apiHost,
      origin: c['origin'],
    );
  }
}

Future<Config> getConfig() async {
  // yamlファイルをyamlStringにロードする
  String yamlString = await rootBundle.loadString('assets/config/local.yml');

  // yamlStringをmapに変換
  Map configMap = loadYaml(yamlString);

  Config config = Config.newConfig(configMap);

  return config;
}
