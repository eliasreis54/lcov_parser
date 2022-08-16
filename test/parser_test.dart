import 'dart:io';

import 'package:lcov_parser/src/exceptions/file_must_be_provided.dart';
import 'package:lcov_parser/src/parser.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  test('Should throw [FileMustBeProvided] when no file is empty', () {
    expectLater(
      Parser.parse(''),
      throwsA(
        TypeMatcher<FileMustBeProvided>(),
      ),
    );
  });

  test('Should return a list of Records when parse success', () async {
    final file =
        p.join(Directory.current.absolute.path, 'lib', 'fixures', 'lcov.info');

    final records = await Parser.parse(file);
    expect(records.length, 19);
  });

  test('parseLines() can be called independently', () async {
    final lines = [
      'SF:lib/src/interceptors/app_version_interceptor.dart',
      'DA:6,1',
      'DA:11,1',
      'DA:13,2',
      'DA:14,3',
      'DA:15,1',
      'DA:19,1',
      'LF:6',
      'LH:6',
      'end_of_record',
    ];

    final records = Parser.parseLines(lines);
    expect(records.single.lines?.details?.length, equals(6));
    expect(records.single.lines?.found, equals(6));
    expect(records.single.lines?.hit, equals(6));
  });
}
