import 'dart:io';
import 'package:args/args.dart';

void main(List<String> args) async {
  final parser = ArgParser();

  parser.addOption('file', abbr: 'f');

  final arguments = parser.parse(args);

  final file = arguments['file'];
  if (file == null) {
    print('you need to pass a file to parse');
    return;
  }
  try {
    final stringFile = await File(file).readAsString();
    final lines = stringFile.split('\n');
    print(lines);
  } catch (e) {
    print(e);
  }
}
