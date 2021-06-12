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
}
