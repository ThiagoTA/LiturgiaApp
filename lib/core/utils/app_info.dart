import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static PackageInfo? _info;

  static Future<PackageInfo> _getInfo() async {
    _info ??= await PackageInfo.fromPlatform();
    return _info!;
  }

  static Future<String> version() async {
    final info = await _getInfo();
    return info.version;
  }

  static Future<String> fullVersion() async {
    final info = await _getInfo();
    return '${info.version}+${info.buildNumber}';
  }
}