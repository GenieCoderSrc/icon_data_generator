import 'dart:io';

/// Find Flutter SDK Path from environment
Future<String> findFlutterSdkPath() async {
  final flutterPathResult = await Process.run('flutter', ['--version', '--machine']);
  if (flutterPathResult.exitCode != 0) {
    throw Exception('Flutter not installed or not available in PATH.');
  }
  final flutterHome = Platform.environment['FLUTTER_ROOT'];
  print('MaterialIconsMapperGenerator | findFlutterSdkPath | flutterHome: $flutterHome');
  if (flutterHome == null) {
    throw Exception('FLUTTER_ROOT environment variable not set.');
  }
  return flutterHome;
}
