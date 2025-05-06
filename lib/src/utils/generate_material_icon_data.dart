import 'dart:io';

import 'package:icon_data_generator/src/utils/find_flutter_sdk_path.dart';
import 'package:icon_data_generator/src/utils/generate_material_icons_mapping.dart';

void generateMaterialIconData() async {
  final flutterSdkPath = await findFlutterSdkPath();
  final materialIconsFile = File('$flutterSdkPath/packages/flutter/lib/src/material/icons.dart');

  print('MaterialIconsMapperGenerator | main materialIconsFile: $materialIconsFile');

  if (!await materialIconsFile.exists()) {
    print('Error: Material icons file not found.');
    return;
  }

  final iconsContent = await materialIconsFile.readAsLines();
  final iconMappings = <String, int>{};


  for (final line in iconsContent) {
    final trimmed = line.trim();

    if (trimmed.startsWith('static const IconData')) {
      final match = RegExp(r'static const IconData (\w+) = IconData\((0x[a-fA-F0-9]+),').firstMatch(trimmed);
      if (match != null) {
        final iconName = match.group(1)!;
        final codePoint = int.parse(match.group(2)!);
        iconMappings[iconName] = codePoint;
      }
    }
  }

  await generateMaterialIconsMapping(iconMappings);
  print('✅ material_icons_mapping.dart generated successfully.');
}