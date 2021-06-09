import 'dart:io';
import 'package:args/args.dart';
import 'package:lcov_parser/src/parse_line.dart';

import 'models/record.dart';
import 'transformer.dart';

void main(List<String> args) async {
  final parser = ArgParser();

  parser.addOption('file', abbr: 'f');

  final arguments = parser.parse(args);

  List<Record> records;
  records = [];

  final file = arguments['file'];
  if (file == null) {
    print('you need to pass a file to parse');
    return;
  }
  final stringFile = await File(file).readAsString();
  final lines = stringFile.split('\n');
  var record = Record.empty();
  for (var line in lines) {
    if (line.isEmpty) {
      break;
    }
    if (ParseLine.isEndOfRecord(line)) {
      records.add(record);
      record = Record.empty();
    } else {
      final lineParsed = ParseLine.parse(line);
      Transformer.transform(record, lineParsed);
    }
  }

  var totalHits = 0;
  var totalFinds = 0;
  records.forEach((rec) {
    totalFinds += rec.lines.found;
    totalHits += rec.lines.hit;
  });

  final coverage = (totalHits / totalFinds) * 100;
  print(coverage);
}
