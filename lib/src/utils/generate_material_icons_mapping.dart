import 'dart:io';

/// Generate the material_icons_mapping.dart file
Future<void> generateMaterialIconsMapping(Map<String, int> iconMappings) async {
  final buffer = StringBuffer();

  buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
  buffer.writeln('// ignore_for_file: constant_identifier_names');
  buffer.writeln('');
  buffer.writeln('class MaterialIconsMapping {');
  buffer.writeln('  static const Map<int, String> iconCodePointToName = {');

  for (final entry in iconMappings.entries) {
    buffer.writeln('    ${entry.value}: \'${entry.key}\',');
  }

  buffer.writeln('  };');
  buffer.writeln('}');

  final output = File('lib/generated/material_icons_mapping.dart');
  await output.create(recursive: true);
  await output.writeAsString(buffer.toString());
}
