import 'dart:io';
import 'package:args/args.dart';
import 'package:lcov_parser/src/parse_line.dart';

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
    for (var line in lines) {
      if (ParseLine.isEndOfRecord(line)) {
        print('fim da linha man');
      } else {
        final lineParsed = ParseLine.parse(line);
        print(lineParsed.type);
      }
    }
  } catch (e) {
    print(e);
  }
}
