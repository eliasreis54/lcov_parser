import 'dart:io';

import 'package:lcov_parser/src/exceptions/file_must_be_provided.dart';
import 'package:lcov_parser/src/parse_line.dart';

import 'models/record.dart';
import 'transformer.dart';

class Parser {
  static Future<List<Record>> parse(String filePath) async {
    if (filePath.isEmpty) {
      return throw FileMustBeProvided();
    }
    final stringFile = await File(filePath).readAsString();
    final lines = stringFile.split('\n');
    return parseLines(lines);
  }

  static List<Record> parseLines(List<String> lines) {
    List<Record> records;
    records = [];
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
    return records;
  }
}
